import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';

class DocumentPage extends StatefulWidget {
  final String title;
  const DocumentPage({super.key, required this.title});

  @override
  State<DocumentPage> createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  final scrollController = ScrollController();
  final sectionKeys = List.generate(5, (_) => GlobalKey());

  double fontSize = 16.0;
  bool showColumns = true;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final isDark = provider.themeMode == 'dark';
    final isAr = provider.language == 'ar';

    final bgColor = isDark ? const Color(0xFF1C1C1C) : Colors.white;
    final textColor = isDark ? Colors.white : Colors.black;
    final redColor = const Color(0xFFFF4545);

    final sections = [
      'Ⲡ̀ⲣⲟⲉⲩⲭⲏ',
      'Gospel',
      'Ⲡ̀ⲛⲉⲩⲙⲁ',
      'Ⲧⲁⲅⲓⲟⲛ',
      'Conclusion',
    ];

    return Directionality(
      textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: bgColor,

        // 🧭 LEFT Drawer
        drawer: Drawer(
          backgroundColor: bgColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: isDark ? Colors.black87 : Colors.grey.shade200),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    isAr ? 'القائمة' : 'Navigator',
                    style: TextStyle(color: textColor, fontSize: 20),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home, color: textColor),
                title: Text(isAr ? 'الرئيسية' : 'Home', style: TextStyle(color: textColor)),
                onTap: () => Navigator.popUntil(context, (route) => route.isFirst),
              ),
              ListTile(
                leading: Icon(Icons.arrow_back, color: textColor),
                title: Text(isAr ? 'رجوع' : 'Back', style: TextStyle(color: textColor)),
                onTap: () => Navigator.pop(context),
              ),
              const Divider(),
              ListTile(
                leading: Icon(Icons.settings, color: textColor),
                title: Text(isAr ? 'الإعدادات' : 'Settings', style: TextStyle(color: textColor)),
                onTap: () {
                  // future settings screen
                },
              ),
              const Divider(),
              ListTile(
                leading: Icon(Icons.text_fields, color: textColor),
                title: Text(isAr ? 'تغيير حجم الخط' : 'Font Size', style: TextStyle(color: textColor)),
                onTap: () {
                  setState(() {
                    fontSize = fontSize == 16 ? 20 : 16;
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.view_column, color: textColor),
                title: Text(isAr ? 'إظهار/إخفاء الأعمدة' : 'Toggle Columns', style: TextStyle(color: textColor)),
                onTap: () {
                  setState(() {
                    showColumns = !showColumns;
                  });
                },
              ),
            ],
          ),
        ),

        // 📚 RIGHT Drawer (ToC)
        endDrawer: Drawer(
          backgroundColor: bgColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: isDark ? Colors.black87 : Colors.grey.shade200),
                child: Text(
                  isAr ? 'جدول المحتويات' : 'Table of Contents',
                  style: TextStyle(color: textColor, fontSize: 18),
                ),
              ),
              for (int i = 0; i < sections.length; i++) ...[
                ListTile(
                  title: Text(sections[i], style: TextStyle(color: textColor, fontSize: 14)),
                  onTap: () {
                    Navigator.pop(context);
                    Scrollable.ensureVisible(
                      sectionKeys[i].currentContext!,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                Divider(color: isDark ? Colors.grey : Colors.black12),
              ],
            ],
          ),
        ),

        // 📝 MAIN CONTENT
        body: SafeArea(
          child: SingleChildScrollView(
            controller: scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'RobotoSlab-Bold',
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 5),
                Container(height: 2, width: 80, color: redColor),
                const SizedBox(height: 20),

                // SECTIONS
                for (int i = 0; i < sections.length; i++)
                  Padding(
                    key: sectionKeys[i],
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sections[i],
                          style: TextStyle(
                            fontSize: fontSize + 2,
                            fontWeight: FontWeight.bold,
                            color: redColor,
                          ),
                        ),
                        const SizedBox(height: 10),

                        // 3-COLUMN SECTION
                        if (showColumns)
                          IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // ENGLISH
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "In the name of the Father, Son and Holy Spirit... (Section $i)",
                                        style: TextStyle(color: textColor, fontSize: fontSize),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        "Blessed is He who comes in the name of the Lord... Amen.",
                                        style: TextStyle(color: textColor, fontSize: fontSize),
                                      ),
                                    ],
                                  ),
                                ),

                                // DIVIDER
                                Container(width: 1.5, color: redColor, margin: const EdgeInsets.symmetric(horizontal: 8)),

                                // COPTIC
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Ⲓⲛ ⲧⲉ ⲣⲁⲛ ⲛ̀ⲧⲉ Ⲡ̀ⲓⲱⲧ... (ⲥⲉⲕⲥⲓⲟⲛ $i)",
                                        style: TextStyle(color: textColor, fontSize: fontSize),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        "Ⲡⲓⲉⲩⲱⲧ ⲉⲑⲛⲁⲩ ⲉ̀ⲡ̀ⲣⲁⲛ ⲛ̀Ⲫⲓⲱⲧ...",
                                        style: TextStyle(color: textColor, fontSize: fontSize),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),

                                // DIVIDER
                                Container(width: 1.5, color: redColor, margin: const EdgeInsets.symmetric(horizontal: 8)),

                                // ARABIC
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "باسم الآب والابن والروح القدس... (قسم $i)",
                                        style: TextStyle(color: textColor, fontSize: fontSize),
                                        textAlign: TextAlign.right,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        "مبارك الآتي باسم الرب...",
                                        style: TextStyle(color: textColor, fontSize: fontSize),
                                        textAlign: TextAlign.right,
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
      ),
    );
  }
}
