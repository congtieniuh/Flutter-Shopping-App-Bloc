import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/localization/app_localization.dart';

const String LANGUAGE_CODE = 'languageCode';
const String ENGLISH = 'en';
const String VIETNAMESE = 'vi';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LANGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LANGUAGE_CODE) ?? ENGLISH;
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return Locale(ENGLISH, 'US');
    case VIETNAMESE:
      return Locale(VIETNAMESE, "VI");
    default:
      return Locale(ENGLISH, 'US');
  }
}

String getTranslated(BuildContext context, String key) {
  return AppLocalization.of(context).translate(key);
}
