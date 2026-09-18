/* 
  VISUALISATIUM MASTER SCHEMA (v2.0)
  Target: Supabase (PostgreSQL 17)
  Context: Phases 1-3 Consolidated + Projects + Vault
*/

-- 1. REFERENCE LISTS (Recursive & Localized)
CREATE TABLE reference_lists (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    list_key TEXT NOT NULL, -- e.g., 'styles', 'historical_events'
    parent_id UUID REFERENCES reference_lists(id),
    label_i18n JSONB NOT NULL,
    meta_data JSONB,
    negative_prompt_injection TEXT -- New: Contextual Negative Prompts
);

-- 2. PROJECTS (New: For Collections/Life Stories)
CREATE TABLE projects (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id TEXT NOT NULL,
    title TEXT NOT NULL, -- e.g., "Grandpa's Life Story"
    status TEXT DEFAULT 'active',
    created_at TIMESTAMPTZ DEFAULT now()
);

-- 3. PRODUCTS (Dynamic Inventory)
CREATE TABLE products (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    sku TEXT UNIQUE NOT NULL,
    category_id TEXT NOT NULL,
    price_credits INT DEFAULT 0,
    price_euro DECIMAL(10,2) DEFAULT 0.00,
    form_config JSONB NOT NULL, -- Defines "Split Choice" inputs
    is_active BOOLEAN DEFAULT true
);

-- 4. ORDERS (Financial Container)
CREATE TABLE orders (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id TEXT NOT NULL,
    project_id UUID REFERENCES projects(id), -- Link to Project
    status TEXT NOT NULL,
    payment_split JSONB, -- {"credits": 10, "stripe_eur": 50.00}
    offer_sent_at TIMESTAMPTZ, -- For 30-day Sunset Rule
    created_at TIMESTAMPTZ DEFAULT now()
);

-- 5. ASSETS (The Genealogy Tree)
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

-- 6. SAVED CHARACTERS (The Vault)
CREATE TABLE saved_characters (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id TEXT NOT NULL,
    name TEXT NOT NULL,
    seed TEXT NOT NULL,
    reference_image_path TEXT,
    created_at TIMESTAMPTZ DEFAULT now()
);