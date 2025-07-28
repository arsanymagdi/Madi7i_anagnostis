import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/document_settings_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DocumentSettingsProvider>(context);
    final isDark = provider.themeMode == ThemeMode.dark;
    final isArabic = provider.language == 'ar';

    return Scaffold(
      appBar: AppBar(
        title: Text(isArabic ? 'الإعدادات' : 'Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Theme Mode
          ListTile(
            title: Text(isArabic ? 'الوضع' : 'Theme Mode'),
            trailing: DropdownButton<ThemeMode>(
              value: provider.themeMode,
              onChanged: (mode) {
                if (mode != null) {
                  provider.setThemeMode(mode);
                }
              },
              items: const [
                DropdownMenuItem(
                  value: ThemeMode.system,
                  child: Text('System'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.light,
                  child: Text('Light'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.dark,
                  child: Text('Dark'),
                ),
              ],
            ),
          ),

          // Language
          ListTile(
            title: Text(isArabic ? 'اللغة' : 'Language'),
            trailing: DropdownButton<String>(
              value: provider.language,
              onChanged: (lang) {
                if (lang != null) {
                  provider.setLanguage(lang);
                }
              },
              items: const [
                DropdownMenuItem(
                  value: 'en',
                  child: Text('English'),
                ),
                DropdownMenuItem(
                  value: 'ar',
                  child: Text('Arabic'),
                ),
              ],
            ),
          ),

          // Font Size
          ListTile(
            title: Text(isArabic ? 'حجم الخط' : 'Font Size'),
            subtitle: Slider(
              value: provider.fontSize,
              min: 10,
              max: 30,
              divisions: 20,
              label: provider.fontSize.toStringAsFixed(0),
              onChanged: (value) {
                provider.setFontSize(value);
              },
            ),
          ),

          const Divider(),

          // Column Language
          ...['left', 'center', 'right'].map((col) {
            return ListTile(
              title: Text('${isArabic ? 'عمود' : 'Column'} $col language'),
              trailing: DropdownButton<String>(
                value: provider.getColumnLanguage(col),
                onChanged: (lang) {
                  if (lang != null) {
                    provider.setColumnLanguage(col, lang);
                  }
                },
                items: ['en', 'ar', 'cop'].map((lang) {
                  return DropdownMenuItem(
                    value: lang,
                    child: Text(lang),
                  );
                }).toList(),
              ),
            );
          }),

          const Divider(),

          // Column Visibility
          ...['left', 'center', 'right'].map((col) {
            return SwitchListTile(
              title: Text('${isArabic ? 'عرض عمود' : 'Show column'} $col'),
              value: provider.columnVisibility[col] ?? true,
              onChanged: (_) => provider.toggleColumnVisibility(col),
            );
          }),

          const Divider(),

          // Reset
          Center(
            child: ElevatedButton(
              onPressed: () => provider.resetSettings(),
              child: Text(isArabic ? 'إعادة الضبط' : 'Reset Settings'),
            ),
          ),
        ],
      ),
    );
  }
}
