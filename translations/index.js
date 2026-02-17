/**
 * TawynDnD — i18n Core Module
 * Centralized translation function + language switching
 * Version: 3.0
 */

import { EN } from './en.js';
import { FR } from './fr.js';

// ═══════════════════════════════════════════════════════════════════
// ░░ TRANSLATIONS MAP
// ═══════════════════════════════════════════════════════════════════
export const TRANSLATIONS = {
  en: EN,
  fr: FR
};

// ═══════════════════════════════════════════════════════════════════
// ░░ DEFAULT LANGUAGE
// ═══════════════════════════════════════════════════════════════════
const DEFAULT_LANG = 'fr'; // Default to French
let currentLanguage = DEFAULT_LANG;

// Load saved language from localStorage
const STORAGE_KEY_LANG = 'tawyndnd-language';
try {
  const saved = localStorage.getItem(STORAGE_KEY_LANG);
  if (saved && (saved === 'en' || saved === 'fr')) {
    currentLanguage = saved;
  }
} catch (e) {
  console.warn('[i18n] localStorage not available, using default language');
}

// ═══════════════════════════════════════════════════════════════════
// ░░ TRANSLATION FUNCTION WITH FALLBACK
// ═══════════════════════════════════════════════════════════════════

/**
 * Translate a key to the current language
 * @param {string} key - Dot-separated key (e.g., 'ui.hp', 'classes.fighter')
 * @param {string} [lang] - Optional: Force a specific language (otherwise uses currentLanguage)
 * @returns {string} Translated string, or fallback EN, or the key itself if not found
 * 
 * @example
 * t('ui.hp')           // Returns "Points de vie" (if currentLanguage is 'fr')
 * t('ui.hp', 'en')     // Returns "Hit Points" (forced EN)
 * t('ui.unknown_key')  // Returns "Hit Points" (fallback to EN) or 'ui.unknown_key' if EN missing
 */
export function t(key, lang = null) {
  const targetLang = lang || currentLanguage;
  
  // Split key into path segments (e.g., 'ui.hp' → ['ui', 'hp'])
  const keys = key.split('.');
  
  // Navigate through the translation object
  let value = TRANSLATIONS[targetLang];
  for (const k of keys) {
    value = value?.[k];
    if (value === undefined) break;
  }
  
  // If found, return it
  if (value !== undefined) return value;
  
  // FALLBACK 1: Try English
  if (targetLang !== 'en') {
    let fallback = TRANSLATIONS['en'];
    for (const k of keys) {
      fallback = fallback?.[k];
      if (fallback === undefined) break;
    }
    if (fallback !== undefined) {
      console.warn(`[i18n] Missing translation for '${key}' in '${targetLang}', using EN fallback`);
      return fallback;
    }
  }
  
  // FALLBACK 2: Return the key itself (better than crashing)
  console.error(`[i18n] Missing translation for '${key}' in all languages`);
  return key;
}

// ═══════════════════════════════════════════════════════════════════
// ░░ LANGUAGE SWITCHING
// ═══════════════════════════════════════════════════════════════════

/**
 * Get the current active language
 * @returns {string} 'en' or 'fr'
 */
export function getCurrentLanguage() {
  return currentLanguage;
}

/**
 * Set the active language and persist to localStorage
 * @param {string} lang - 'en' or 'fr'
 * @throws {Error} If language is not supported
 */
export function setLanguage(lang) {
  if (!TRANSLATIONS[lang]) {
    throw new Error(`[i18n] Unsupported language: ${lang}. Available: ${Object.keys(TRANSLATIONS).join(', ')}`);
  }
  
  currentLanguage = lang;
  
  // Save to localStorage
  try {
    localStorage.setItem(STORAGE_KEY_LANG, lang);
  } catch (e) {
    console.warn('[i18n] Could not save language preference to localStorage');
  }
  
  console.log(`[i18n] Language switched to: ${lang}`);
}

/**
 * Toggle between EN and FR
 * @returns {string} The new active language
 */
export function toggleLanguage() {
  const newLang = currentLanguage === 'en' ? 'fr' : 'en';
  setLanguage(newLang);
  return newLang;
}

// ═══════════════════════════════════════════════════════════════════
// ░░ UTILITY: Get all available languages
// ═══════════════════════════════════════════════════════════════════
export function getAvailableLanguages() {
  return Object.keys(TRANSLATIONS);
}

// ═══════════════════════════════════════════════════════════════════
// ░░ EXPORT DEFAULT FOR CONVENIENCE
// ═══════════════════════════════════════════════════════════════════
export default {
  t,
  getCurrentLanguage,
  setLanguage,
  toggleLanguage,
  getAvailableLanguages,
  TRANSLATIONS
};
