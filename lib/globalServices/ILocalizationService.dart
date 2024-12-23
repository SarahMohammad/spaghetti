import 'package:flutter/material.dart';

abstract class ILocalizationService {
  Future<void> loadTranslationsFiles();
  Future<void> changeLocale(String lang);
  Locale? getLocaleFromLanguage(String lang);
  String getCurrentLocal();
}
