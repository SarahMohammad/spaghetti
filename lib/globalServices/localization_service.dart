import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'ILocalizationService.dart';

class LocalizationService extends Translations implements ILocalizationService {
  LocalizationService() {
    loadTranslationsFiles();
  }

  static Map<String, String> en = {"x": "x"};
  static Map<String, String> ar = {"x": "x"};
  // Default locale
  static const locale = Locale('en', 'US');

  // fallbackLocale saves the day when the locale gets in trouble
  static const fallbackLocale = Locale('en', 'US');
  static const langs = [
    'English',
    'Arabic',
  ];

  @override
  Future<void> loadTranslationsFiles() async {
    try {
      en = Map<String, String>.from(
          json.decode(await rootBundle.loadString('i18n/en.json')));
      ar = Map<String, String>.from(
          json.decode(await rootBundle.loadString('i18n/ar.json')));
    } catch (ex) {
      log(ex.toString());
    }
  }

  static final locales = [
    const Locale('en', 'US'),
    const Locale('ar', 'AR'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en,
        'ar_AR': ar,
      };

  // Gets locale from language, and updates the locale
  @override
  Future<void> changeLocale(String lang) async {
    final locale = getLocaleFromLanguage(lang);
    Get.updateLocale(locale!);
  }

  @override
  String getCurrentLocal() {
    return Get.locale.toString();
  }

  // Finds language in `langs` list and returns it as Locale
  @override
  Locale? getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }

}
