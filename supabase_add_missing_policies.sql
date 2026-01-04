-- Eksik RLS Policy'leri Ekle
-- Bu SQL'i Supabase SQL Editor'de çalıştır

-- Locations policies
DROP POLICY IF EXISTS "Public insert access for locations" ON locations;
CREATE POLICY "Public insert access for locations" ON locations
  FOR INSERT WITH CHECK (true);

DROP POLICY IF EXISTS "Public update access for locations" ON locations;
CREATE POLICY "Public update access for locations" ON locations
  FOR UPDATE USING (true);

DROP POLICY IF EXISTS "Public delete access for locations" ON locations;
CREATE POLICY "Public delete access for locations" ON locations
  FOR DELETE USING (true);

-- Boat Types policies
DROP POLICY IF EXISTS "Public insert access for boat_types" ON boat_types;
CREATE POLICY "Public insert access for boat_types" ON boat_types
  FOR INSERT WITH CHECK (true);

DROP POLICY IF EXISTS "Public update access for boat_types" ON boat_types;
CREATE POLICY "Public update access for boat_types" ON boat_types
  FOR UPDATE USING (true);

DROP POLICY IF EXISTS "Public delete access for boat_types" ON boat_types;
CREATE POLICY "Public delete access for boat_types" ON boat_types
  FOR DELETE USING (true);

-- Amenities policies
DROP POLICY IF EXISTS "Public insert access for amenities" ON amenities;
CREATE POLICY "Public insert access for amenities" ON amenities
  FOR INSERT WITH CHECK (true);

DROP POLICY IF EXISTS "Public update access for amenities" ON amenities;
CREATE POLICY "Public update access for amenities" ON amenities
  FOR UPDATE USING (true);

DROP POLICY IF EXISTS "Public delete access for amenities" ON amenities;
CREATE POLICY "Public delete access for amenities" ON amenities
  FOR DELETE USING (true);

-- Captains policies
DROP POLICY IF EXISTS "Public insert access for captains" ON captains;
CREATE POLICY "Public insert access for captains" ON captains
  FOR INSERT WITH CHECK (true);

DROP POLICY IF EXISTS "Public update access for captains" ON captains;
CREATE POLICY "Public update access for captains" ON captains
  FOR UPDATE USING (true);

DROP POLICY IF EXISTS "Public delete access for captains" ON captains;
CREATE POLICY "Public delete access for captains" ON captains
  FOR DELETE USING (true);

-- Boat Owners policies
DROP POLICY IF EXISTS "Public insert access for boat_owners" ON boat_owners;
CREATE POLICY "Public insert access for boat_owners" ON boat_owners
  FOR INSERT WITH CHECK (true);

DROP POLICY IF EXISTS "Public update access for boat_owners" ON boat_owners;
CREATE POLICY "Public update access for boat_owners" ON boat_owners
  FOR UPDATE USING (true);

DROP POLICY IF EXISTS "Public delete access for boat_owners" ON boat_owners;
CREATE POLICY "Public delete access for boat_owners" ON boat_owners
  FOR DELETE USING (true);

-- Addons policies
DROP POLICY IF EXISTS "Public insert access for addons" ON addons;
CREATE POLICY "Public insert access for addons" ON addons
  FOR INSERT WITH CHECK (true);

DROP POLICY IF EXISTS "Public update access for addons" ON addons;
CREATE POLICY "Public update access for addons" ON addons
  FOR UPDATE USING (true);

DROP POLICY IF EXISTS "Public delete access for addons" ON addons;
CREATE POLICY "Public delete access for addons" ON addons
  FOR DELETE USING (true);

-- FAQs policies
DROP POLICY IF EXISTS "Public insert access for faqs" ON faqs;
CREATE POLICY "Public insert access for faqs" ON faqs
  FOR INSERT WITH CHECK (true);

DROP POLICY IF EXISTS "Public update access for faqs" ON faqs;
CREATE POLICY "Public update access for faqs" ON faqs
  FOR UPDATE USING (true);

DROP POLICY IF EXISTS "Public delete access for faqs" ON faqs;
CREATE POLICY "Public delete access for faqs" ON faqs
  FOR DELETE USING (true);

