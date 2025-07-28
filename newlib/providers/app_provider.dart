import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  String _language = 'en';

  ThemeMode get themeMode => _themeMode;
  String get language => _language;

  TextDirection get textDirection =>
      _language == 'ar' ? TextDirection.rtl : TextDirection.ltr;

  AppProvider() {
    _loadSettings();
  }

  void _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('themeMode');
    final lang = prefs.getString('language');

    _themeMode = (theme == 'dark') ? ThemeMode.dark : ThemeMode.light;
    _language = (lang == 'ar') ? 'ar' : 'en';

    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('themeMode', mode == ThemeMode.dark ? 'dark' : 'light');
    notifyListeners();
  }

  Future<void> setLanguage(String langCode) async {
    if (langCode != 'en' && langCode != 'ar') return;
    _language = langCode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', _language);
    notifyListeners();
  }

  Future<void> setAll({required String themeMode, required String language}) async {
    _themeMode = (themeMode == 'dark') ? ThemeMode.dark : ThemeMode.light;
    _language = (language == 'ar') ? 'ar' : 'en';

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('themeMode', themeMode);
    await prefs.setString('language', language);

    notifyListeners();
  }
}
