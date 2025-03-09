import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class LocalizationService extends ChangeNotifier {
  Locale _locale = const Locale('en');
  Map<String, dynamic> _translations = {};

  Locale get locale => _locale;
  Map<String, dynamic> get translations => _translations;

  Future<void> loadTranslations() async {
    final jsonString = await rootBundle.loadString(
      'assets/locales/${_locale.languageCode}.json',
    );
    _translations = jsonDecode(jsonString);
    notifyListeners(); // Notify listeners to rebuild
  }

  void setLocale(Locale locale) async {
    _locale = locale;
    await loadTranslations(); // Load translations for the new locale
  }

  String translate(String key) {
    return _translations[key] ??
        key; // Fallback to the key if translation is missing
  }
}
