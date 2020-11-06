import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalization {
  static final AppLocalization _singleton = AppLocalization._internal();

  AppLocalization._internal();

  static AppLocalization get instance => _singleton;

  Map<String, String> _localizedValues;

  Future<AppLocalization> load(Locale locale) async {
    String jsonStringValues = await rootBundle
        .loadString('assets/locale/localization_${locale.languageCode}.json');
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    _localizedValues =
        mappedJson.map((key, value) => MapEntry(key, value.toString()));

    return this;
  }

  // static member to have simple access to the delegate from Material App
  static const LocalizationsDelegate<AppLocalization> delegate =
      _AppLocalizationsDelegate();

  String text(String key) {
    return _localizedValues[key] ?? "$key not found";
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalization> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'vi'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    return AppLocalization.instance.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalization> old) => true;
}
