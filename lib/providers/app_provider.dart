import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider with ChangeNotifier {
  // Global Settings
  String _language = 'en';
  String _themeMode = 'light';

  // Document Page Settings
  double _documentFontSize = 16.0;
  bool _showDocumentColumn = true;

  // Getters
  String get language => _language;
  String get themeMode => _themeMode;

  double get documentFontSize => _documentFontSize;
  bool get showDocumentColumn => _showDocumentColumn;

  AppProvider() {
    _loadFromPrefs();
  }

  // Load settings from SharedPreferences
  void _loadFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _language = prefs.getString('language') ?? 'en';
    _themeMode = prefs.getString('themeMode') ?? 'light';
    _documentFontSize = prefs.getDouble('documentFontSize') ?? 16.0;
    _showDocumentColumn = prefs.getBool('showDocumentColumn') ?? true;

    notifyListeners();
  }

  // Setters for global settings
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

  // Setters for document-only settings
  void setDocumentFontSize(double size) async {
    _documentFontSize = size;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('documentFontSize', size);
    notifyListeners();
  }

  void toggleDocumentColumn() async {
    _showDocumentColumn = !_showDocumentColumn;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('showDocumentColumn', _showDocumentColumn);
    notifyListeners();
  }

  // Helpers for theme/language toggle
  void toggleTheme() {
    setThemeMode(_themeMode == 'light' ? 'dark' : 'light');
  }

  void toggleLanguage() {
    setLanguage(_language == 'en' ? 'ar' : 'en');
  }

  // Theme check shortcut
  bool get isDarkTheme => _themeMode == 'dark';
  bool get isArabic => _language == 'ar';
}
