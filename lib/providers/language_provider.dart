import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  static const String _languageKey = 'selected_language';
  
  Locale _currentLocale = const Locale('zh', 'HK'); // Default to Chinese (Hong Kong)
  
  Locale get currentLocale => _currentLocale;
  
  // Supported locales
  static const List<Locale> supportedLocales = [
    Locale('en'), // English
    Locale('zh'), // Simplified Chinese
    Locale('zh', 'HK'), // Traditional Chinese (Hong Kong)
  ];
  
  // Language change callback
  Function(Locale)? onLanguageChanged;
  
  LanguageProvider() {
    _loadSavedLanguage();
  }
  
  /// Load saved language from SharedPreferences
  Future<void> _loadSavedLanguage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final languageCode = prefs.getString(_languageKey);
      
      if (languageCode != null) {
        final parts = languageCode.split('_');
        if (parts.length == 2) {
          _currentLocale = Locale(parts[0], parts[1]);
        } else {
          _currentLocale = Locale(parts[0]);
        }
        notifyListeners();
      }
    } catch (e) {
      // If loading fails, keep default locale
      debugPrint('Failed to load saved language: $e');
    }
  }
  
  /// Change language and save to SharedPreferences
  Future<void> changeLanguage(Locale locale) async {
    if (_currentLocale == locale) return;
    
    _currentLocale = locale;
    notifyListeners();
    
    // Save to SharedPreferences
    try {
      final prefs = await SharedPreferences.getInstance();
      final languageCode = locale.countryCode != null 
          ? '${locale.languageCode}_${locale.countryCode}'
          : locale.languageCode;
      await prefs.setString(_languageKey, languageCode);
    } catch (e) {
      debugPrint('Failed to save language: $e');
    }
    
    // Call language change callback
    onLanguageChanged?.call(locale);
  }
  
  /// Get display name for locale
  String getLocaleDisplayName(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return 'English';
      case 'zh':
        if (locale.countryCode == 'HK') {
          return '繁體中文';
        }
        return '简体中文';
      default:
        return locale.languageCode;
    }
  }
  
  /// Check if locale is supported
  bool isLocaleSupported(Locale locale) {
    return supportedLocales.any((supportedLocale) =>
        supportedLocale.languageCode == locale.languageCode &&
        supportedLocale.countryCode == locale.countryCode);
  }
}
