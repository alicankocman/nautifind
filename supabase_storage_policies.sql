-- Supabase Storage Bucket RLS Policy'leri
-- Bu SQL'i Supabase SQL Editor'de çalıştır
-- ÖNEMLİ: Önce bucket'ları oluşturmanız gerekiyor (boat-images ve location-images)

-- boat-images bucket için policy'ler
-- SELECT (Okuma) - Herkes okuyabilir (public bucket)
DROP POLICY IF EXISTS "Public read access for boat-images" ON storage.objects;
CREATE POLICY "Public read access for boat-images"
ON storage.objects FOR SELECT
USING (bucket_id = 'boat-images');

-- INSERT (Yükleme) - Herkes yükleyebilir
DROP POLICY IF EXISTS "Public insert access for boat-images" ON storage.objects;
CREATE POLICY "Public insert access for boat-images"
ON storage.objects FOR INSERT
WITH CHECK (bucket_id = 'boat-images');

-- UPDATE (Güncelleme) - Herkes güncelleyebilir
DROP POLICY IF EXISTS "Public update access for boat-images" ON storage.objects;
CREATE POLICY "Public update access for boat-images"
ON storage.objects FOR UPDATE
USING (bucket_id = 'boat-images')
WITH CHECK (bucket_id = 'boat-images');

-- DELETE (Silme) - Herkes silebilir
DROP POLICY IF EXISTS "Public delete access for boat-images" ON storage.objects;
CREATE POLICY "Public delete access for boat-images"
ON storage.objects FOR DELETE
USING (bucket_id = 'boat-images');

-- location-images bucket için policy'ler
-- SELECT (Okuma) - Herkes okuyabilir (public bucket)
DROP POLICY IF EXISTS "Public read access for location-images" ON storage.objects;
CREATE POLICY "Public read access for location-images"
ON storage.objects FOR SELECT
USING (bucket_id = 'location-images');

-- INSERT (Yükleme) - Herkes yükleyebilir
DROP POLICY IF EXISTS "Public insert access for location-images" ON storage.objects;
CREATE POLICY "Public insert access for location-images"
ON storage.objects FOR INSERT
WITH CHECK (bucket_id = 'location-images');

-- UPDATE (Güncelleme) - Herkes güncelleyebilir
DROP POLICY IF EXISTS "Public update access for location-images" ON storage.objects;
CREATE POLICY "Public update access for location-images"
ON storage.objects FOR UPDATE
USING (bucket_id = 'location-images')
WITH CHECK (bucket_id = 'location-images');

-- DELETE (Silme) - Herkes silebilir
DROP POLICY IF EXISTS "Public delete access for location-images" ON storage.objects;
CREATE POLICY "Public delete access for location-images"
ON storage.objects FOR DELETE
USING (bucket_id = 'location-images');

