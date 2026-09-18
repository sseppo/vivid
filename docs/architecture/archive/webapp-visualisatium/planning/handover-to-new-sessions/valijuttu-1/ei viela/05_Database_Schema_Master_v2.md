> **Status:** historical — family F10; superseded by `docs/architecture/database-schema-blueprint.md`. Kept for provenance; not current. Source: `Visualisatium/planning/handover-to-new-sessions/valijuttu-1/ei viela/05_Database_Schema_Master_v2.md`. 

# DATABASE SCHEMA & DATA STRATEGY (v3.3)
> **Target:** Supabase (PostgreSQL 17)
> **Strategy:** JSON-Driven Forms ("Dynamic Products") + Recursive Genealogy.
> **Source of Truth:** Combined SQL, Strategy Docs, and JSON Configuration.

## 1. DOMAIN GLOSSARY (Terminology Map)

| User-Facing Term | System/DB Term | Definition |
| :--- | :--- | :--- |
| **Order / Item** | `Order` | A single financial transaction unit (contains 1 or more assets). |
| **Result / File** | `Asset` | The actual file (Image/Video) generated and stored in R2. |
| **Middle Stage** | `Parent_Asset` | A previous version of an asset in the Genealogy tree. |

### Status Mapping
| User UI Label | System Status ID | Meaning |
| :--- | :--- | :--- |
| **"Waiting for Quote"** | `offer_req` | User sent request, CCA hasn't replied. |
| **"Quote Ready"** | `offer_sent` | CCA sent price, waiting for User. |
| **"Archived"** | `archived_abandoned` | 30 days no activity. |
| **"Restored"** | `offer_restored` | User brought back an archived offer (Phoenix Protocol). |

## 2. THE "DYNAMIC PRODUCT" STRATEGY (JSONB Dynamic Forms)

**Problem:** `ProductsSold.docx` (Inventory) defines wildly different input rules for different products (e.g., "Upload One Image" vs "Select Era + Write Text" vs "Select Style AND/OR Artist"). Hardcoding columns (`style_id`, `artist_id`, `text_input`) is brittle.

**Solution:** We store the *Input Contract* (Form Definition) in the `products` table using **JSONB**. The Frontend reads this JSON to render the correct UI form dynamically.

### Table: `products`
| Column | Type | Description |
| :--- | :--- | :--- |
| `id` | UUID | Primary Key |
| `sku` | TEXT | e.g., "IMG-MEM-ENHANCE" |
| `category_path` | LTREE | Hierarchy (e.g., `Image.Memories.Enhancement`) |
| **`form_config`** | **JSONB** | **Defines the Form UI (See below)** |


### A. Example `form_config` JSON
This tells the Frontend what to render.
~~~json
{
  "attachments": {
    "required": true,
    "label": "Upload Reference / photo to enhance",
    "max_count": 5,
    "mode": "one_image" // Options: one_image, many_media
  },
  "inputs": [
    {
      "id": "event_select",
      "type": "reference_list",
      "source": "historical_events", // Loads from Reference Table
      "allow_custom_text": true, // Handles the "OR Free Text" rule
	  "logic": "AND", // User can pick this AND Free Text
      "label": "Select Event or Describe"
    },
    {
      "id": "style_select",
      "type": "reference_list",
      "source": "styles",
      "multi_select_logic": "AND" // User can mix styles
    }
  ]
}
~~~

### B. Input Logic Configuration (`data_strategy_config`)
**Purpose:** Rules for parsing the `form_config`.

* **`allow_custom_text`**: (Boolean) If true, the UI renders the "Split Choice" component (List selection + "Or write your own" text area).
* **`multi_select_logic`**: (Enum: `AND`, `OR`, `XOR`) Defines if user can pick multiple items from a list.
    * *Example:* `AND` = "Cyberpunk" + "Noir" (Valid).
    * *Example:* `XOR` = "Male" or "Female" (Mutually Exclusive).
* **`min_attachments`**: (Integer) Enforced by the Uppy.io widget before submission is allowed.
* **`price_modifier_logic`**: (JSON Formula) How specific form inputs affect the final credit cost.
    * *Example:* `if video_length > 30s then cost += 5`

## 3. THE "SMART LIST" TRANSFORMATION
**Analysis:** The document lists "Styles" (Watercolor, Noir) and "Recipes" (The Hero Reveal). In the Agentic Era, these cannot be static text.
**Architecture Upgrade:**
* **Vector Embeddings:** We will not just match the string "Noir"; we will inject a hidden "Prompt Payload" associated with "Noir" (e.g., `(chiaroscuro lighting:1.4), (black and white:1.2)`).
* **Dependency:** These lists become the **Configuration Nodes** for the *Smart Collections* engine.


## 4. SQL MASTER SCHEMA
> **Source:** `Database_Schema_Master_combined.sql`

~~~sql
/* 1. REFERENCE LISTS (Recursive & Localized) */
-- Holds "Styles", "Historical Events", "Genres"
CREATE TABLE reference_lists (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    list_key TEXT NOT NULL, -- e.g., 'styles', 'historical_events'
    parent_id UUID REFERENCES reference_lists(id), -- Recursive (Style -> Sub-Style)
    label_i18n JSONB NOT NULL, -- {"en": "Watercolor", "fi": "Vesiväri"}
    meta_data JSONB, -- Prompt Payloads: {"prompt": "(watercolor style:1.2)"}
    negative_prompt_injection TEXT -- Contextual Negative Prompts
);

/* 2. Collections */
-- The Container for User Content
CREATE TABLE collections (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id TEXT NOT NULL, -- Clerk ID
    title TEXT NOT NULL, 
    status TEXT DEFAULT 'active',
    global_style_context JSONB, -- Context Inheritance
    created_at TIMESTAMPTZ DEFAULT now()
);

/* 3. PRODUCTS (Dynamic Inventory) */
-- The Catalog Definitions
CREATE TABLE products (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    sku TEXT UNIQUE NOT NULL,
    category_id TEXT NOT NULL, -- Linked to Master_Categories.json via App Logic
    name_i18n JSONB,
    form_config JSONB -- The UI Definition (See Section 2)
	
	 -- CONTENT
    name_i18n JSONB NOT NULL,       -- {"en": "...", "fi": "..."}
    description_i18n JSONB NOT NULL,
    main_image_path TEXT NOT NULL,
    sample_result_paths TEXT[],     
    
    -- CONFIGURATION
    variations_allowed INT DEFAULT 1,
    manual_work_estimate_hours DECIMAL(4,1),
    is_social_share_enabled BOOLEAN DEFAULT true,
    
    -- PRICING
    price_credits INT DEFAULT 0,
    price_euro DECIMAL(10,2) DEFAULT 0.00,
    allow_price_override BOOLEAN DEFAULT false,
    
    -- DYNAMIC FORM
    form_config JSONB NOT NULL, -- Defines "Split Choice" inputs
    is_active BOOLEAN DEFAULT true
);

/* 4. ORDERS (Financials) */
-- The Transaction Unit
CREATE TABLE orders (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id TEXT NOT NULL,
    project_id UUID REFERENCES projects(id),
    status TEXT DEFAULT 'draft',
    cca_id TEXT, -- Assigned Creator (if applicable)
    
    -- Financials (The Hybrid Calc)
    cost_total NUMERIC(10,2),
    payment_split JSONB, -- {"credits": 10, "stripe_eur": 50.00}
    offer_sent_at TIMESTAMPTZ, -- For 30-day Sunset Rule
    created_at TIMESTAMPTZ DEFAULT now()
);

/* 5. ASSETS (The Genealogy Tree) */
-- The actual Files
CREATE TABLE assets (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    order_id UUID REFERENCES orders(id),
    parent_asset_id UUID REFERENCES assets(id), -- Genealogy Link (Original -> Edit)
    r2_path TEXT NOT NULL,
    is_watermarked BOOLEAN DEFAULT true,
    
    -- CONSISTENCY ENGINE
    character_seed TEXT,
    saved_character_id UUID -- Links to "The Vault"
);

/* 6. SAVED CHARACTERS (The Vault) */
-- Asset DNA storage
CREATE TABLE saved_characters (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id TEXT NOT NULL,
    name TEXT NOT NULL,
    seed TEXT NOT NULL,
    reference_image_path TEXT,
    created_at TIMESTAMPTZ DEFAULT now()
);

/* 7. SUPPORT TICKETS */
-- In-app Support
CREATE TABLE support_tickets (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id TEXT NOT NULL,
    related_order_id UUID REFERENCES orders(id), -- Topic-Bound (No floating tickets)
    category TEXT, -- 'billing', 'feature_request', 'bug'
    status TEXT DEFAULT 'open'
);
/* 8. CHAT MESSAGES */
-- CHAT MESSAGES
CREATE TABLE chat_messages (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    ticket_id UUID REFERENCES support_tickets(id),
    sender_id TEXT NOT NULL,
    sender_role TEXT NOT NULL, -- 'admin', 'user', 'partner'
    message_text TEXT,
    attachments JSONB,
    is_internal_note BOOLEAN DEFAULT false
);
~~~