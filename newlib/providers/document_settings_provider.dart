import 'package:flutter/material.dart';

class DocumentSettingsProvider with ChangeNotifier {
  // Theme
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;
  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  // Language (ar or en)
  String _language = 'en';
  String get language => _language;
  void setLanguage(String lang) {
    _language = lang;
    notifyListeners();
  }

  // Font size
  double _fontSize = 16;
  double get fontSize => _fontSize;
  void setFontSize(double size) {
    _fontSize = size;
    notifyListeners();
  }

  // Column languages
  final Map<String, String> _columnLanguages = {
    'left': 'en',
    'center': 'cop',
    'right': 'ar',
  };
  Map<String, String> get columnLanguages => _columnLanguages;

  String getColumnLanguage(String column) => _columnLanguages[column] ?? 'cop';
  void setColumnLanguage(String column, String lang) {
    _columnLanguages[column] = lang;
    notifyListeners();
  }

  // Column visibility
  final Map<String, bool> _columnVisibility = {
    'left': true,
    'center': true,
    'right': true,
  };
  Map<String, bool> get columnVisibility => _columnVisibility;

  void toggleColumnVisibility(String column) {
    _columnVisibility[column] = !(_columnVisibility[column] ?? true);
    notifyListeners();
  }

  // Reset settings
  void resetSettings() {
    _themeMode = ThemeMode.system;
    _language = 'en';
    _fontSize = 16;
    _columnLanguages['left'] = 'en';
    _columnLanguages['center'] = 'cop';
    _columnLanguages['right'] = 'ar';
    _columnVisibility['left'] = true;
    _columnVisibility['center'] = true;
    _columnVisibility['right'] = true;
    notifyListeners();
  }

  List<String> getOtherSelectedLanguages(String excludeColumn) {
    return _columnLanguages.entries
        .where((entry) => entry.key != excludeColumn)
        .map((e) => e.value)
        .toList();
  }
}
