import { supabase } from "../lib/supabaseClient.js";

/**
 * Email ve şifre ile giriş yapar
 * ⚠️ Sadece Supabase ile çalışır
 * @param {string} email - Kullanıcı email'i
 * @param {string} password - Kullanıcı şifresi
 * @returns {Promise<{user: Object, session: Object}>}
 */
export async function login(email, password) {
  if (!supabase) {
    throw new Error("Login işlemi için Supabase bağlantısı gereklidir");
  }
  try {
    const { data, error } = await supabase.auth.signInWithPassword({
      email,
      password,
    });

    if (error) throw error;
    return data;
  } catch (error) {
    console.error("Error logging in:", error);
    throw error;
  }
}

/**
 * Çıkış yapar
 * ⚠️ Sadece Supabase ile çalışır
 * @returns {Promise<void>}
 */
export async function logout() {
  if (!supabase) {
    console.warn("⚠️ Supabase yok, logout işlemi atlandı");
    return;
  }
  try {
    const { error } = await supabase.auth.signOut();
    if (error) throw error;
  } catch (error) {
    console.error("Error logging out:", error);
    throw error;
  }
}

/**
 * Mevcut kullanıcıyı getirir
 * ⚠️ Sadece Supabase ile çalışır - local data'da null döner
 * @returns {Promise<Object|null>} Kullanıcı objesi veya null
 */
export async function getCurrentUser() {
  if (!supabase) {
    return null; // Local data'da auth yok
  }
  try {
    const {
      data: { user },
      error,
    } = await supabase.auth.getUser();
    
    // Session yoksa veya hata varsa null döndür (sessizce handle et)
    if (error || !user) {
      return null;
    }
    
    return user;
  } catch (error) {
    // Auth session missing gibi hataları sessizce handle et
    if (error.message?.includes("session") || error.message?.includes("Auth")) {
      return null;
    }
    console.error("Error getting current user:", error);
    return null;
  }
}

/**
 * Yeni kullanıcı kaydı oluşturur
 * @param {string} email - Kullanıcı email'i
 * @param {string} password - Kullanıcı şifresi
 * @returns {Promise<{user: Object, session: Object}>}
 */
export async function signUp(email, password) {
  try {
    const { data, error } = await supabase.auth.signUp({
      email,
      password,
    });

    if (error) throw error;
    return data;
  } catch (error) {
    console.error("Error signing up:", error);
    throw error;
  }
}

/**
 * Auth state değişikliklerini dinler
 * ⚠️ Sadece Supabase ile çalışır - local data'da mock subscription döner
 * @param {Function} callback - Auth state değiştiğinde çağrılacak callback
 * @returns {{data: {subscription: {unsubscribe: Function}}}} Unsubscribe fonksiyonu
 */
export function onAuthStateChange(callback) {
  if (!supabase) {
    // Mock subscription - local data'da auth yok
    return {
      data: {
        subscription: {
          unsubscribe: () => {}, // Mock unsubscribe fonksiyonu
        },
      },
    };
  }
  return supabase.auth.onAuthStateChange(callback);
}
