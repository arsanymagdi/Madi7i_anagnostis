import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final theme = Theme.of(context); // current theme

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor, // ✨ Use theme background
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary, // ✨ Use themed primary color
        title: Text(
          provider.isArabic ? 'الإعدادات' : 'Settings',
          style: TextStyle(color: theme.colorScheme.onPrimary), // adapt text color
        ),
        iconTheme: IconThemeData(color: theme.colorScheme.onPrimary),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Theme Mode Dropdown
          ListTile(
            title: Text(
              provider.isArabic ? 'الوضع' : 'Theme',
              style: TextStyle(color: theme.textTheme.bodyLarge!.color),
            ),
            trailing: DropdownButton<String>(
              value: provider.themeMode,
              dropdownColor: theme.dialogBackgroundColor, // for dark mode dropdown
              onChanged: (value) {
                if (value != null) provider.setThemeMode(value);
              },
              items: const [
                DropdownMenuItem(value: 'light', child: Text('Light')),
                DropdownMenuItem(value: 'dark', child: Text('Dark')),
              ],
            ),
          ),

          // Language Dropdown
          ListTile(
            title: Text(
              provider.isArabic ? 'اللغة' : 'Language',
              style: TextStyle(color: theme.textTheme.bodyLarge!.color),
            ),
            trailing: DropdownButton<String>(
              value: provider.language,
              dropdownColor: theme.dialogBackgroundColor,
              onChanged: (value) {
                if (value != null) provider.setLanguage(value);
              },
              items: const [
                DropdownMenuItem(value: 'en', child: Text('English')),
                DropdownMenuItem(value: 'ar', child: Text('العربية')),
              ],
            ),
          ),

          const Divider(),

          // Font Size Slider
          ListTile(
            title: Text(
              provider.isArabic ? 'حجم الخط' : 'Font Size',
              style: TextStyle(color: theme.textTheme.bodyLarge!.color),
            ),
            subtitle: Slider(
              value: provider.documentFontSize,
              min: 12,
              max: 30,
              divisions: 18,
              activeColor: const Color(0xFFFF4545),
              label: provider.documentFontSize.toInt().toString(),
              onChanged: (value) => provider.setDocumentFontSize(value),
            ),
          ),

          const Divider(),

          // Column toggles
          SwitchListTile(
            title: Text(
              provider.isArabic ? 'إظهار عمود الإنجليزي' : 'Show English Column',
              style: TextStyle(color: theme.textTheme.bodyLarge!.color),
            ),
            value: provider.showEnglishColumn,
            activeColor: const Color(0xFFFF4545),
            onChanged: (_) => provider.toggleEnglishColumn(),
          ),
          SwitchListTile(
            title: Text(
              provider.isArabic ? 'إظهار عمود العربي' : 'Show Arabic Column',
              style: TextStyle(color: theme.textTheme.bodyLarge!.color),
            ),
            value: provider.showArabicColumn,
            activeColor: const Color(0xFFFF4545),
            onChanged: (_) => provider.toggleArabicColumn(),
          ),
          SwitchListTile(
            title: Text(
              provider.isArabic ? 'إظهار عمود القبطي' : 'Show Coptic Column',
              style: TextStyle(color: theme.textTheme.bodyLarge!.color),
            ),
            value: provider.showCopticColumn,
            activeColor: const Color(0xFFFF4545),
            onChanged: (_) => provider.toggleCopticColumn(),
          ),
        ],
      ),
    );
  }
}
