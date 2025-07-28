import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'settings_screen.dart';
import '../providers/document_settings_provider.dart'; // ✅ Correct provider

class DocumentPage extends StatelessWidget {
  final String title;

  const DocumentPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    final provider = Provider.of<DocumentSettingsProvider>(context); // ✅ use correct provider
    final isDark = provider.themeMode == ThemeMode.dark; // ✅ use ThemeMode not string
    final isArabic = provider.language == 'ar';

    final sectionKeys = List.generate(5, (_) => GlobalKey());
    final sections = isArabic
        ? ['Ⲡ̀ⲣⲟⲉⲩⲭⲏ', 'الإنجيل', 'Ⲡ̀ⲛⲉⲩⲙⲁ', 'Ⲧⲁⲅⲓⲟⲛ', 'الختام']
        : ['Ⲡ̀ⲣⲟⲉⲩⲭⲏ', 'Gospel', 'Ⲡ̀ⲛⲉⲩⲙⲁ', 'Ⲧⲁⲅⲓⲟⲛ', 'Conclusion'];

    Color bgColor = isDark ? const Color(0xFF1C1C1C) : Colors.white;
    Color fgColor = isDark ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: bgColor,

      drawer: Drawer(
        backgroundColor: bgColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: isDark ? Colors.black87 : Colors.red.shade100),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    isArabic ? 'التنقل' : 'Navigator',
                    style: TextStyle(color: fgColor, fontSize: 20),
                  ),
                ),
              ),
              Container( 
                margin: const EdgeInsets.symmetric(horizontal: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF4545),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Text(
                      'Wednesday, July 16, 2025',
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Ⲡⲓⲟⲩⲟⲉⲓⲧ 9, 1741',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const Divider(color: Colors.grey),
              ListTile(
                leading: Icon(Icons.home, color: fgColor),
                title: Text(isArabic ? 'الرئيسية' : 'Home', style: TextStyle(color: fgColor)),
                onTap: () => Navigator.popUntil(context, (route) => route.isFirst),
              ),
              ListTile(
                leading: Icon(Icons.arrow_back, color: fgColor),
                title: Text(isArabic ? 'رجوع' : 'Back', style: TextStyle(color: fgColor)),
                onTap: () => Navigator.pop(context),
              ),
              const Divider(color: Colors.grey),
              ListTile(
                leading: Icon(Icons.settings, color: fgColor),
                title: Text(isArabic ? 'الإعدادات' : 'Settings', style: TextStyle(color: fgColor)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SettingsScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),

      endDrawer: Drawer(
        backgroundColor: bgColor,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: isDark ? Colors.black87 : Colors.red.shade100),
              child: Text(
                isArabic ? 'جدول المحتوى' : 'Table of Contents',
                style: TextStyle(color: fgColor, fontSize: 18),
              ),
            ),
            for (int i = 0; i < sections.length; i++)
              Column(
                children: [
                  ListTile(
                    title: Text(
                      sections[i],
                      style: TextStyle(color: fgColor),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      final contextKey = sectionKeys[i].currentContext;
                      if (contextKey != null) {
                        Scrollable.ensureVisible(
                          contextKey,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                  const Divider(color: Colors.grey),
                ],
              ),
          ],
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'RobotoSlab-Bold',
                  color: fgColor,
                ),
              ),
              const SizedBox(height: 5),
              Container(height: 2, width: 80, color: const Color(0xFFFF4545)),
              const SizedBox(height: 20),

              for (int i = 0; i < sections.length; i++)
                Padding(
                  key: sectionKeys[i],
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sections[i],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF4545),
                        ),
                      ),
                      const SizedBox(height: 10),
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // English
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "In the name of the Father... (Section $i)",
                                    style: TextStyle(color: fgColor, fontSize: 16),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Blessed is He who comes...",
                                    style: TextStyle(color: fgColor, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            Container(width: 1.5, color: const Color(0xFFFF4545), margin: const EdgeInsets.symmetric(horizontal: 8)),

                            // Coptic
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Ⲓⲛ ⲧⲉ ⲣⲁⲛ ⲛ̀ⲧⲉ Ⲡ̀ⲓⲱⲧ... (ⲥⲉⲕⲥⲓⲟⲛ $i)",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: fgColor, fontSize: 16),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Ⲡⲓⲉⲩⲱⲧ ⲉⲑⲛⲁⲩ...",
                                    style: TextStyle(color: fgColor, fontSize: 16),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            Container(width: 1.5, color: const Color(0xFFFF4545), margin: const EdgeInsets.symmetric(horizontal: 8)),

                            // Arabic
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "باسم الآب والابن... (قسم $i)",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(color: fgColor, fontSize: 16),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "مبارك الآتي باسم الرب...",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(color: fgColor, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
