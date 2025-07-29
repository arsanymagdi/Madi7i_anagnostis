import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart'; // Make sure the path is correct

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);

    final isDark = provider.isDarkTheme;
    final isArabic = provider.isArabic;
    final fontSize = provider.documentFontSize;
    final showColumn = provider.showDocumentColumn;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isArabic ? 'الإعدادات' : 'Settings',
          style: const TextStyle(fontFamily: 'RobotoSlab-Bold'),
        ),
        backgroundColor: isDark ? Colors.black : Colors.white,
        foregroundColor: isDark ? Colors.white : Colors.black,
      ),
      backgroundColor: isDark ? const Color(0xFF1C1C1C) : Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        children: [

          // 🌙 Theme Toggle (Full App)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isArabic ? 'الوضع الداكن' : 'Dark Mode',
                style: TextStyle(
                  fontSize: 18,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              Switch(
                value: isDark,
                onChanged: (_) => provider.toggleTheme(),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // 🌐 Language Toggle (Full App)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isArabic ? 'اللغة العربية' : 'Arabic Language',
                style: TextStyle(
                  fontSize: 18,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              Switch(
                value: isArabic,
                onChanged: (_) => provider.toggleLanguage(),
              ),
            ],
          ),
          const Divider(height: 40),

          // 📄 Column Toggle (Only for Document Page)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isArabic ? 'إظهار العمود الجانبي' : 'Show Side Column',
                style: TextStyle(
                  fontSize: 18,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              Switch(
                value: showColumn,
                onChanged: (_) => provider.toggleDocumentColumn(),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // 🔤 Font Size Slider (Only for Document Page)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isArabic ? 'حجم الخط في صفحة المستند' : 'Document Font Size',
                style: TextStyle(
                  fontSize: 18,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              Slider(
                value: fontSize,
                min: 12,
                max: 28,
                divisions: 8,
                label: fontSize.toStringAsFixed(0),
                onChanged: (value) => provider.setDocumentFontSize(value),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
