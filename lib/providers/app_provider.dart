import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider with ChangeNotifier {
  String _language = 'en';
  String _themeMode = 'light';

  String get language => _language;
  String get themeMode => _themeMode;

  AppProvider() {
    _loadFromPrefs();
  }

  void _loadFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _language = prefs.getString('language') ?? 'en';
    _themeMode = prefs.getString('themeMode') ?? 'light';
    notifyListeners();
  }

  void setLanguage(String lang) async {
    _language = lang;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', lang);
    notifyListeners();
  }

  void setThemeMode(String mode) async {
    _themeMode = mode;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('themeMode', mode);
    notifyListeners();
  }
}
