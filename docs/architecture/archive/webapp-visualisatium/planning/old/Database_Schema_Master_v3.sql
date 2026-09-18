/* VISUALISATIUM MASTER SCHEMA (v3.0) */

-- 1. PRODUCTS (Expanded via ProductOutline.docx)
CREATE TABLE products (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    sku TEXT UNIQUE NOT NULL,
    category_id TEXT NOT NULL,
    
    -- CONTENT (ProductOutline.docx)
    name_i18n JSONB NOT NULL,       -- {"en": "...", "fi": "..."}
    description_i18n JSONB NOT NULL,
    main_image_path TEXT NOT NULL,
    sample_result_paths TEXT[],     -- "Few samples of resulted images"
    
    -- CONFIGURATION
    variations_allowed INT DEFAULT 1,
    manual_work_estimate_hours DECIMAL(4,1),
    is_social_share_enabled BOOLEAN DEFAULT true,
    
    -- PRICING
    price_credits INT DEFAULT 0,
    price_euro DECIMAL(10,2) DEFAULT 0.00,
    allow_price_override BOOLEAN DEFAULT false,
    
    -- DYNAMIC FORM
    form_config JSONB NOT NULL, 
    
    is_active BOOLEAN DEFAULT true
);

-- 2. PROJECTS (Collections)
CREATE TABLE projects (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id TEXT NOT NULL,
    title TEXT NOT NULL,
    global_style_context JSONB, -- Context Inheritance
    status TEXT DEFAULT 'active'
);

-- 3. SUPPORT TICKETS
CREATE TABLE support_tickets (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id TEXT NOT NULL,
    related_order_id UUID REFERENCES orders(id), -- Topic-Bound
    category TEXT, -- 'billing', 'feature_request', 'bug'
    status TEXT DEFAULT 'open'
);

-- 4. CHAT MESSAGES
CREATE TABLE chat_messages (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    ticket_id UUID REFERENCES support_tickets(id),
    sender_id TEXT NOT NULL,
    sender_role TEXT NOT NULL, -- 'admin', 'user', 'partner'
    message_text TEXT,
    attachments JSONB,
    is_internal_note BOOLEAN DEFAULT false
);