import { createClient } from "@supabase/supabase-js";

// Environment variables'ı al
const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_PUBLISHABLE_DEFAULT_KEY;

// ✅ Supabase bağlantısını optional yap - local data kullanımı için
// Eğer env variable'lar yoksa, local data kullanılacak
let supabase = null;

if (supabaseUrl && supabaseAnonKey) {
  try {
    supabase = createClient(supabaseUrl, supabaseAnonKey);
    console.log("✅ Supabase bağlantısı başarılı");
  } catch (error) {
    console.warn("⚠️ Supabase bağlantısı kurulamadı, local data kullanılacak:", error);
    supabase = null;
  }
} else {
  console.log("ℹ️ Supabase env variable'ları bulunamadı, local data kullanılacak");
}

export { supabase };
