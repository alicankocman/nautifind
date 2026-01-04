-- NautiFind Database Schema
-- Bu SQL'i Supabase SQL Editor'de çalıştır

-- 1. Locations (Lokasyonlar)
CREATE TABLE IF NOT EXISTS locations (
  id BIGSERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  title TEXT,
  image_url TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 2. Boat Types (Tekne Tipleri)
CREATE TABLE IF NOT EXISTS boat_types (
  id BIGSERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 3. Amenities (Özellikler)
CREATE TABLE IF NOT EXISTS amenities (
  id BIGSERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 4. Captains (Kaptanlar)
CREATE TABLE IF NOT EXISTS captains (
  id BIGSERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  phone TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 5. Boat Owners (Tekne Sahipleri)
CREATE TABLE IF NOT EXISTS boat_owners (
  id BIGSERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  phone TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 6. Boats (Tekneler) - Ana Tablo
CREATE TABLE IF NOT EXISTS boats (
  id BIGSERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  type_id BIGINT REFERENCES boat_types(id) ON DELETE SET NULL,
  title TEXT,
  images TEXT[] DEFAULT '{}',
  duration_type TEXT NOT NULL CHECK (duration_type IN ('Saatlik', 'Günübirlik', 'Konaklamalı')),
  captain_id BIGINT REFERENCES captains(id) ON DELETE SET NULL,
  owner_id BIGINT REFERENCES boat_owners(id) ON DELETE SET NULL,
  location_id BIGINT REFERENCES locations(id) ON DELETE SET NULL,
  cabin_count INTEGER DEFAULT 0,
  person_capacity INTEGER DEFAULT 0,
  travel_capacity INTEGER NOT NULL DEFAULT 1,
  length TEXT,
  details TEXT,
  amenity_ids BIGINT[] DEFAULT '{}',
  price DECIMAL(10, 2) NOT NULL,
  discount DECIMAL(10, 2) DEFAULT 0,
  url TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 7. Addons (Ek Hizmetler)
CREATE TABLE IF NOT EXISTS addons (
  id BIGSERIAL PRIMARY KEY,
  label TEXT NOT NULL,
  price TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 8. FAQs (Sık Sorulan Sorular)
CREATE TABLE IF NOT EXISTS faqs (
  id BIGSERIAL PRIMARY KEY,
  question TEXT NOT NULL,
  answer TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Indexes for better performance
CREATE INDEX IF NOT EXISTS idx_boats_location_id ON boats(location_id);
CREATE INDEX IF NOT EXISTS idx_boats_type_id ON boats(type_id);
CREATE INDEX IF NOT EXISTS idx_boats_captain_id ON boats(captain_id);
CREATE INDEX IF NOT EXISTS idx_boats_owner_id ON boats(owner_id);

-- Enable Row Level Security (RLS)
ALTER TABLE locations ENABLE ROW LEVEL SECURITY;
ALTER TABLE boat_types ENABLE ROW LEVEL SECURITY;
ALTER TABLE amenities ENABLE ROW LEVEL SECURITY;
ALTER TABLE captains ENABLE ROW LEVEL SECURITY;
ALTER TABLE boat_owners ENABLE ROW LEVEL SECURITY;
ALTER TABLE boats ENABLE ROW LEVEL SECURITY;
ALTER TABLE addons ENABLE ROW LEVEL SECURITY;
ALTER TABLE faqs ENABLE ROW LEVEL SECURITY;

-- RLS Policies - Public read access (herkes okuyabilir)
CREATE POLICY "Public read access for locations" ON locations
  FOR SELECT USING (true);

CREATE POLICY "Public read access for boat_types" ON boat_types
  FOR SELECT USING (true);

CREATE POLICY "Public read access for amenities" ON amenities
  FOR SELECT USING (true);

CREATE POLICY "Public read access for captains" ON captains
  FOR SELECT USING (true);

CREATE POLICY "Public read access for boat_owners" ON boat_owners
  FOR SELECT USING (true);

CREATE POLICY "Public read access for boats" ON boats
  FOR SELECT USING (true);

CREATE POLICY "Public read access for addons" ON addons
  FOR SELECT USING (true);

CREATE POLICY "Public read access for faqs" ON faqs
  FOR SELECT USING (true);

-- Admin write access (sadece authenticated users - ileride admin kontrolü eklenebilir)
-- Şimdilik herkes yazabilir, production'da admin kontrolü ekle

-- Locations policies
CREATE POLICY "Public insert access for locations" ON locations
  FOR INSERT WITH CHECK (true);
CREATE POLICY "Public update access for locations" ON locations
  FOR UPDATE USING (true);
CREATE POLICY "Public delete access for locations" ON locations
  FOR DELETE USING (true);

-- Boat Types policies
CREATE POLICY "Public insert access for boat_types" ON boat_types
  FOR INSERT WITH CHECK (true);
CREATE POLICY "Public update access for boat_types" ON boat_types
  FOR UPDATE USING (true);
CREATE POLICY "Public delete access for boat_types" ON boat_types
  FOR DELETE USING (true);

-- Amenities policies
CREATE POLICY "Public insert access for amenities" ON amenities
  FOR INSERT WITH CHECK (true);
CREATE POLICY "Public update access for amenities" ON amenities
  FOR UPDATE USING (true);
CREATE POLICY "Public delete access for amenities" ON amenities
  FOR DELETE USING (true);

-- Captains policies
CREATE POLICY "Public insert access for captains" ON captains
  FOR INSERT WITH CHECK (true);
CREATE POLICY "Public update access for captains" ON captains
  FOR UPDATE USING (true);
CREATE POLICY "Public delete access for captains" ON captains
  FOR DELETE USING (true);

-- Boat Owners policies
CREATE POLICY "Public insert access for boat_owners" ON boat_owners
  FOR INSERT WITH CHECK (true);
CREATE POLICY "Public update access for boat_owners" ON boat_owners
  FOR UPDATE USING (true);
CREATE POLICY "Public delete access for boat_owners" ON boat_owners
  FOR DELETE USING (true);

-- Boats policies
CREATE POLICY "Public insert access for boats" ON boats
  FOR INSERT WITH CHECK (true);
CREATE POLICY "Public update access for boats" ON boats
  FOR UPDATE USING (true);
CREATE POLICY "Public delete access for boats" ON boats
  FOR DELETE USING (true);

-- Addons policies
CREATE POLICY "Public insert access for addons" ON addons
  FOR INSERT WITH CHECK (true);
CREATE POLICY "Public update access for addons" ON addons
  FOR UPDATE USING (true);
CREATE POLICY "Public delete access for addons" ON addons
  FOR DELETE USING (true);

-- FAQs policies
CREATE POLICY "Public insert access for faqs" ON faqs
  FOR INSERT WITH CHECK (true);
CREATE POLICY "Public update access for faqs" ON faqs
  FOR UPDATE USING (true);
CREATE POLICY "Public delete access for faqs" ON faqs
  FOR DELETE USING (true);

-- Updated_at trigger function
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Triggers for updated_at
CREATE TRIGGER update_locations_updated_at BEFORE UPDATE ON locations
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_boat_types_updated_at BEFORE UPDATE ON boat_types
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_amenities_updated_at BEFORE UPDATE ON amenities
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_captains_updated_at BEFORE UPDATE ON captains
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_boat_owners_updated_at BEFORE UPDATE ON boat_owners
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_boats_updated_at BEFORE UPDATE ON boats
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_addons_updated_at BEFORE UPDATE ON addons
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_faqs_updated_at BEFORE UPDATE ON faqs
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

