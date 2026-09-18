-- RLS Policies and JWT Extraction
CREATE OR REPLACE FUNCTION auth.get_user_role() RETURNS TEXT AS $$
  SELECT (auth.jwt() -> 'user_metadata' ->> 'role')::TEXT;
$$ LANGUAGE SQL STABLE SECURITY DEFINER;

-- 1. Users Policies
CREATE POLICY "Users can view public accounts or themselves" ON users
  FOR SELECT USING (auth.uid() = id OR auth.get_user_role() = 'admin');

CREATE POLICY "Users can update themselves" ON users
  FOR UPDATE USING (auth.uid() = id OR auth.get_user_role() = 'admin');

-- 2. Partners Policies
CREATE POLICY "Public Read for partners" ON partners
  FOR SELECT USING (true); -- Directory is essentially public

CREATE POLICY "Partners can modify own profile" ON partners
  FOR UPDATE USING (user_id = auth.uid() OR auth.get_user_role() = 'admin');

CREATE POLICY "Admin full partner access" ON partners
  FOR ALL USING (auth.get_user_role() = 'admin');

-- 3. Products
CREATE POLICY "Public Read for active products" ON products
  FOR SELECT USING (active = true OR auth.get_user_role() = 'admin');

CREATE POLICY "Admin full products access" ON products
  FOR ALL USING (auth.get_user_role() = 'admin');

-- 4. Collection Templates
CREATE POLICY "Public Read for templates" ON collection_templates
  FOR SELECT USING (true);

CREATE POLICY "Admin full templates access" ON collection_templates
  FOR ALL USING (auth.get_user_role() = 'admin');

-- 5. Prompt Lists
CREATE POLICY "Public Read for prompt_lists" ON prompt_lists
  FOR SELECT USING (is_active = true OR auth.get_user_role() = 'admin');

CREATE POLICY "Admin full prompt lists access" ON prompt_lists
  FOR ALL USING (auth.get_user_role() = 'admin');

-- 6. Asset DNA
CREATE POLICY "Users can view own DNA" ON asset_dna
  FOR SELECT USING (
    user_id = auth.uid() 
    OR auth.get_user_role() = 'admin' 
    OR (auth.get_user_role() = 'cca' AND EXISTS (SELECT 1 FROM orders WHERE orders.asset_dna_id = asset_dna.id AND orders.cca_id = auth.uid()))
  );

CREATE POLICY "Users can insert own DNA" ON asset_dna
  FOR INSERT WITH CHECK (user_id = auth.uid() OR auth.get_user_role() = 'admin');

CREATE POLICY "Users can update own DNA" ON asset_dna
  FOR UPDATE USING (user_id = auth.uid() OR auth.get_user_role() = 'admin');

CREATE POLICY "Admin full DNA access" ON asset_dna
  FOR ALL USING (auth.get_user_role() = 'admin');

-- 7. Orders
CREATE POLICY "Stakeholder view orders" ON orders
  FOR SELECT USING (
    user_id = auth.uid() 
    OR cca_id = auth.uid() 
    OR auth.get_user_role() = 'admin' 
    OR (auth.get_user_role() = 'cca' AND status = 'claimable')
  );

CREATE POLICY "Users place orders" ON orders
  FOR INSERT WITH CHECK (user_id = auth.uid() OR auth.get_user_role() = 'admin');

CREATE POLICY "Order updates" ON orders
  FOR UPDATE USING (
    user_id = auth.uid() 
    OR cca_id = auth.uid() 
    OR auth.get_user_role() = 'admin'
  );

CREATE POLICY "Admin full order access" ON orders
  FOR ALL USING (auth.get_user_role() = 'admin');

-- 8. Smart Ledger
CREATE POLICY "View Smart Ledger" ON smart_ledger
  FOR SELECT USING (
    auth.get_user_role() = 'admin' 
    OR EXISTS (SELECT 1 FROM orders WHERE orders.id = smart_ledger.order_id AND (orders.user_id = auth.uid() OR orders.cca_id = auth.uid()))
  );

CREATE POLICY "Admin full ledger access" ON smart_ledger
  FOR ALL USING (auth.get_user_role() = 'admin');

-- 9. Physical Logistics
CREATE POLICY "View Physical Logistics" ON physical_logistics
  FOR SELECT USING (
    auth.get_user_role() = 'admin'
    OR partner_id IN (SELECT id FROM partners WHERE user_id = auth.uid())
    OR EXISTS (SELECT 1 FROM orders WHERE orders.id = physical_logistics.order_id AND orders.user_id = auth.uid())
  );

CREATE POLICY "Update Physical Logistics" ON physical_logistics
  FOR UPDATE USING (
    auth.get_user_role() = 'admin'
    OR partner_id IN (SELECT id FROM partners WHERE user_id = auth.uid())
  );

CREATE POLICY "Admin full logistics access" ON physical_logistics
  FOR ALL USING (auth.get_user_role() = 'admin');
