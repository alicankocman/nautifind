/**
 * Supabase Storage Bucket'larını Oluştur
 * Bu script'i Node.js ile çalıştırabilirsiniz
 * 
 * Kullanım:
 * 1. .env dosyasına Supabase bilgilerini ekle
 * 2. node create_storage_buckets.js
 */

import { createClient } from '@supabase/supabase-js';
import * as dotenv from 'dotenv';

dotenv.config();

const supabaseUrl = process.env.VITE_SUPABASE_URL;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY; // Service role key gerekli

if (!supabaseUrl || !supabaseServiceKey) {
  console.error('❌ VITE_SUPABASE_URL ve SUPABASE_SERVICE_ROLE_KEY environment variable\'ları gerekli!');
  process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseServiceKey, {
  auth: {
    autoRefreshToken: false,
    persistSession: false
  }
});

const buckets = [
  {
    name: 'boat-images',
    public: true,
    fileSizeLimit: 5242880, // 5MB
    allowedMimeTypes: ['image/jpeg', 'image/png', 'image/webp', 'image/gif']
  },
  {
    name: 'location-images',
    public: true,
    fileSizeLimit: 5242880, // 5MB
    allowedMimeTypes: ['image/jpeg', 'image/png', 'image/webp', 'image/gif']
  }
];

async function createBuckets() {
  console.log('🚀 Supabase Storage bucket\'larını oluşturuyorum...\n');

  for (const bucket of buckets) {
    try {
      // Bucket'ın var olup olmadığını kontrol et
      const { data: existingBuckets, error: listError } = await supabase.storage.listBuckets();
      
      if (listError) {
        console.error(`❌ Bucket listesi alınamadı:`, listError);
        continue;
      }

      const bucketExists = existingBuckets.some(b => b.name === bucket.name);

      if (bucketExists) {
        console.log(`✅ Bucket "${bucket.name}" zaten mevcut, atlanıyor...`);
        continue;
      }

      // Bucket oluştur
      const { data, error } = await supabase.storage.createBucket(bucket.name, {
        public: bucket.public,
        fileSizeLimit: bucket.fileSizeLimit,
        allowedMimeTypes: bucket.allowedMimeTypes
      });

      if (error) {
        console.error(`❌ Bucket "${bucket.name}" oluşturulamadı:`, error.message);
      } else {
        console.log(`✅ Bucket "${bucket.name}" başarıyla oluşturuldu!`);
      }
    } catch (error) {
      console.error(`❌ Bucket "${bucket.name}" oluşturulurken hata:`, error.message);
    }
  }

  console.log('\n✨ İşlem tamamlandı!');
}

createBuckets();

