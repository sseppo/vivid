-- Phase 1 & 2 Blueprint Schema Translation

-- ENUMS --

CREATE TYPE order_status AS ENUM (
  'draft', 'offer_req', 'offer_req_without_pay', 'claimable', 'claimed', 
  'offer_sent', 'counter_offer_received', 'offer_rejected', 'awaiting_pay', 
  'parting_requested', 'partially_pay', 'paid', 'in_progress', 'action_req', 
  'prod_ready', 'delivered', 'disputed', 'redo_progress', 'refunded', 
  'completed', 'archived_abandoned', 'offer_restored', 'paused_insufficient_funds'
);

CREATE TYPE wallet_types AS ENUM (
  'user_wallet', 'escrow_pool', 'cca_pending', 'cca_available', 
  'platform_rev', 'payout_stripe'
);

CREATE TYPE transaction_status AS ENUM (
  'HELD', 'PENDING', 'CLEARED', 'PAID', 'VOID'
);

CREATE TYPE user_role AS ENUM (
  'user', 'cca', 'partner', 'admin'
);

CREATE TYPE logistics_status AS ENUM (
  'awaiting_shipment', 'in_transit_inbound', 'physical_received', 
  'processing_digital', 'in_transit_outbound', 'items_returned'
);

-- FUNCTIONS --

CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';


-- TABLES --

CREATE TABLE users (
  id UUID PRIMARY KEY, -- Maps to Clerk UserID
  role user_role DEFAULT 'user',
  credit_balance NUMERIC DEFAULT 0,
  preservation_score INTEGER DEFAULT 0,
  quality_streak_count INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE partners (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  company_name TEXT NOT NULL,
  contact_info JSONB,
  tier TEXT,
  is_verified BOOLEAN DEFAULT FALSE,
  royalty_rate NUMERIC DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE products (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  description TEXT,
  product_type TEXT, -- generic, collection, saga, automated_creation
  base_price_cents INTEGER NOT NULL DEFAULT 0,
  is_offer_based BOOLEAN DEFAULT FALSE,
  active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE collection_templates (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  dependency_graph JSONB NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE prompt_lists (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  category TEXT NOT NULL,
  name TEXT NOT NULL,
  description TEXT,
  hidden_prompt_payload JSONB,
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE asset_dna (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  character_name TEXT,
  dna_payload JSONB NOT NULL,
  reference_files JSONB,
  origin_order_id UUID, -- Will add foreign key later
  status TEXT DEFAULT 'active',
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE orders (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  product_id UUID REFERENCES products(id) ON DELETE RESTRICT,
  cca_id UUID REFERENCES users(id) ON DELETE SET NULL,
  parent_order_id UUID REFERENCES orders(id) ON DELETE CASCADE,
  step_sequence INTEGER,
  status order_status NOT NULL DEFAULT 'draft',
  input_data JSONB,
  asset_dna_id UUID REFERENCES asset_dna(id) ON DELETE SET NULL,
  total_cost_cents INTEGER,
  amount_paid_cents INTEGER DEFAULT 0,
  -- Financial variables
  fifo_realized_revenue_cents INTEGER,
  vat_cents INTEGER,
  stripe_fee_cents INTEGER,
  cca_payout_cents INTEGER,
  partner_royalty_cents INTEGER,
  upsell_origin_partner_id UUID REFERENCES partners(id) ON DELETE SET NULL,
  review_period_ends_at TIMESTAMPTZ,
  is_restored BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Deferred FK
ALTER TABLE asset_dna ADD CONSTRAINT fk_asset_dna_origin_order FOREIGN KEY (origin_order_id) REFERENCES orders(id) ON DELETE SET NULL;

CREATE TABLE smart_ledger (
  transaction_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  order_id UUID REFERENCES orders(id) ON DELETE CASCADE,
  source_wallet wallet_types NOT NULL,
  dest_wallet wallet_types NOT NULL,
  amount NUMERIC NOT NULL,
  currency TEXT NOT NULL, -- 'EUR' or 'CREDIT'
  status transaction_status NOT NULL DEFAULT 'PENDING',
  trigger_event TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE physical_logistics (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  order_id UUID REFERENCES orders(id) ON DELETE CASCADE,
  partner_id UUID REFERENCES partners(id) ON DELETE CASCADE,
  tracking_code TEXT,
  status logistics_status NOT NULL DEFAULT 'awaiting_shipment',
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- TRIGGERS & RLS --

CREATE TRIGGER update_users_updated_at BEFORE UPDATE ON users FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_partners_updated_at BEFORE UPDATE ON partners FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_products_updated_at BEFORE UPDATE ON products FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_collection_templates_updated_at BEFORE UPDATE ON collection_templates FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_prompt_lists_updated_at BEFORE UPDATE ON prompt_lists FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_asset_dna_updated_at BEFORE UPDATE ON asset_dna FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_orders_updated_at BEFORE UPDATE ON orders FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_smart_ledger_updated_at BEFORE UPDATE ON smart_ledger FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_physical_logistics_updated_at BEFORE UPDATE ON physical_logistics FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE partners ENABLE ROW LEVEL SECURITY;
ALTER TABLE products ENABLE ROW LEVEL SECURITY;
ALTER TABLE collection_templates ENABLE ROW LEVEL SECURITY;
ALTER TABLE prompt_lists ENABLE ROW LEVEL SECURITY;
ALTER TABLE asset_dna ENABLE ROW LEVEL SECURITY;
ALTER TABLE orders ENABLE ROW LEVEL SECURITY;
ALTER TABLE smart_ledger ENABLE ROW LEVEL SECURITY;
ALTER TABLE physical_logistics ENABLE ROW LEVEL SECURITY;
