import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider with ChangeNotifier {
  // Global Settings
  String _language = 'en'; // 'en', 'ar', 'cop'
  String _themeMode = 'light'; // 'light' or 'dark'

  // Document Page Settings
  double _documentFontSize = 16.0;
  bool _showEnglishColumn = true;
  bool _showArabicColumn = true;
  bool _showCopticColumn = true;

  // Getters
  String get language => _language;
  String get themeMode => _themeMode;

  double get documentFontSize => _documentFontSize;
  bool get showEnglishColumn => _showEnglishColumn;
  bool get showArabicColumn => _showArabicColumn;
  bool get showCopticColumn => _showCopticColumn;

  AppProvider() {
    _loadFromPrefs();
  }

  // Load all settings from SharedPreferences
  void _loadFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _language = prefs.getString('language') ?? 'en';
    _themeMode = prefs.getString('themeMode') ?? 'light';
    _documentFontSize = prefs.getDouble('documentFontSize') ?? 16.0;
    _showEnglishColumn = prefs.getBool('showEnglishColumn') ?? true;
    _showArabicColumn = prefs.getBool('showArabicColumn') ?? true;
    _showCopticColumn = prefs.getBool('showCopticColumn') ?? true;

    notifyListeners();
  }

  // Language and Theme
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

  // Font size
  void setDocumentFontSize(double size) async {
    _documentFontSize = size;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('documentFontSize', size);
    notifyListeners();
  }

  // Column toggles
  void toggleEnglishColumn() async {
    _showEnglishColumn = !_showEnglishColumn;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('showEnglishColumn', _showEnglishColumn);
    notifyListeners();
  }

  void toggleArabicColumn() async {
    _showArabicColumn = !_showArabicColumn;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('showArabicColumn', _showArabicColumn);
    notifyListeners();
  }

  void toggleCopticColumn() async {
    _showCopticColumn = !_showCopticColumn;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('showCopticColumn', _showCopticColumn);
    notifyListeners();
  }

  // Helpers
  void toggleTheme() {
    setThemeMode(_themeMode == 'light' ? 'dark' : 'light');
  }

  void toggleLanguage() {
    if (_language == 'en') {
      setLanguage('ar');
    } else if (_language == 'ar') {
      setLanguage('cop');
    } else {
      setLanguage('en');
    }
  }

  // Convenience getters
  bool get isDarkTheme => _themeMode == 'dark';
  bool get isArabic => _language == 'ar';
  bool get isEnglish => _language == 'en';
  bool get isCoptic => _language == 'cop';
}
