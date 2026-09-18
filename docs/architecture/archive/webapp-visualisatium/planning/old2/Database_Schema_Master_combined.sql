/* VISUALISATIUM MASTER SCHEMA (Consolidated v3.1)
  Target: Supabase (PostgreSQL 17)
  Synthesis: Unions products (v3), projects (v2+v3), orders/assets (v2), support (v3)
*/

-- 1. REFERENCE LISTS (Recursive & Localized) [Source: v2.0]
CREATE TABLE reference_lists (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    list_key TEXT NOT NULL, -- e.g., 'styles', 'historical_events'
    parent_id UUID REFERENCES reference_lists(id),
    label_i18n JSONB NOT NULL,
    meta_data JSONB,
    negative_prompt_injection TEXT -- Contextual Negative Prompts
);

-- 2. PROJECTS (Collections/Life Stories) [Source: v2.0 + v3.0]
CREATE TABLE projects (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id TEXT NOT NULL,
    title TEXT NOT NULL, 
    status TEXT DEFAULT 'active',
    global_style_context JSONB, -- [v3.0] Context Inheritance
    created_at TIMESTAMPTZ DEFAULT now()
);

-- 3. PRODUCTS (Dynamic Inventory) [Source: v3.0 Expanded]
CREATE TABLE products (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    sku TEXT UNIQUE NOT NULL,
    category_id TEXT NOT NULL,
    
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

-- 4. ORDERS (Financial Container) [Source: v2.0]
CREATE TABLE orders (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id TEXT NOT NULL,
    project_id UUID REFERENCES projects(id),
    status TEXT NOT NULL,
    payment_split JSONB, -- {"credits": 10, "stripe_eur": 50.00}
    offer_sent_at TIMESTAMPTZ, -- For 30-day Sunset Rule
    created_at TIMESTAMPTZ DEFAULT now()
);

-- 5. ASSETS (The Genealogy Tree) [Source: v2.0]
CREATE TABLE assets (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    order_id UUID REFERENCES orders(id),
    parent_asset_id UUID REFERENCES assets(id), -- Genealogy Link
    r2_path TEXT NOT NULL,
    is_watermarked BOOLEAN DEFAULT true,
    
    -- CONSISTENCY ENGINE
    character_seed TEXT,
    saved_character_id UUID
);

-- 6. SAVED CHARACTERS (The Vault) [Source: v2.0]
CREATE TABLE saved_characters (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id TEXT NOT NULL,
    name TEXT NOT NULL,
    seed TEXT NOT NULL,
    reference_image_path TEXT,
    created_at TIMESTAMPTZ DEFAULT now()
);

-- 7. SUPPORT TICKETS [Source: v3.0]
CREATE TABLE support_tickets (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id TEXT NOT NULL,
    related_order_id UUID REFERENCES orders(id), -- Topic-Bound
    category TEXT, -- 'billing', 'feature_request', 'bug'
    status TEXT DEFAULT 'open'
);

-- 8. CHAT MESSAGES [Source: v3.0]
CREATE TABLE chat_messages (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    ticket_id UUID REFERENCES support_tickets(id),
    sender_id TEXT NOT NULL,
    sender_role TEXT NOT NULL, -- 'admin', 'user', 'partner'
    message_text TEXT,
    attachments JSONB,
    is_internal_note BOOLEAN DEFAULT false
);