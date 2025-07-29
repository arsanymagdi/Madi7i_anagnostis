import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import 'settings_screen.dart';

class DocumentPage extends StatefulWidget {
  final String title;
  const DocumentPage({super.key, required this.title});

  @override
  State<DocumentPage> createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  final scrollController = ScrollController();

  final List<Map<String, dynamic>> sections = [
    {'title': 'Ⲡ̀ⲣⲟⲉⲩⲭⲏ', 'expanded': true},
    {'title': 'Gospel', 'expanded': false},
    {'title': 'Ⲡ̀ⲛⲉⲩⲙⲁ', 'expanded': false},
    {'title': 'Ⲧⲁⲅⲓⲟⲛ', 'expanded': false},
    {'title': 'Conclusion', 'expanded': false},
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final isDark = provider.themeMode == 'dark';
    final isAr = provider.language == 'ar';
    final fontSize = provider.documentFontSize;
    final showColumns = provider.showDocumentColumn;

    final bgColor = isDark ? const Color(0xFF1C1C1C) : Colors.white;
    final textColor = isDark ? Colors.white : Colors.black;
    final redColor = const Color(0xFFFF4545);

    return Directionality(
      textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: bgColor,
        drawer: Drawer(
          backgroundColor: bgColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: isDark ? Colors.black87 : Colors.grey.shade200,
                ),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SettingsScreen()),
                  );
                },
              ),
              const Divider(),
              ListTile(
                leading: Icon(Icons.text_increase, color: textColor),
                title: Text(isAr ? 'تكبير الخط' : 'Increase Font Size', style: TextStyle(color: textColor)),
                onTap: () => provider.setDocumentFontSize(fontSize + 1),
              ),
              ListTile(
                leading: Icon(Icons.text_decrease, color: textColor),
                title: Text(isAr ? 'تصغير الخط' : 'Decrease Font Size', style: TextStyle(color: textColor)),
                onTap: () => provider.setDocumentFontSize(fontSize - 1),
              ),
              ListTile(
                leading: Icon(Icons.view_column, color: textColor),
                title: Text(isAr ? 'إظهار/إخفاء الأعمدة' : 'Toggle Columns', style: TextStyle(color: textColor)),
                onTap: () => provider.toggleDocumentColumn(),
              ),
            ],
          ),
        ),
        endDrawer: Drawer(
          backgroundColor: bgColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: isDark ? Colors.black87 : Colors.grey.shade200,
                ),
                child: Text(
                  isAr ? 'جدول المحتويات' : 'Table of Contents',
                  style: TextStyle(color: textColor, fontSize: 18),
                ),
              ),
              for (int i = 0; i < sections.length; i++) ...[
                ListTile(
                  title: Text(sections[i]['title'], style: TextStyle(color: textColor, fontSize: 14)),
                  onTap: () {
                    Navigator.pop(context);
                    // TODO: implement scroll to section if needed
                  },
                ),
                Divider(color: isDark ? Colors.grey : Colors.black12),
              ],
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

                // Sections loop
                for (int i = 0; i < sections.length; i++) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        sections[i]['title'],
                        style: TextStyle(
                          fontSize: fontSize + 2,
                          fontWeight: FontWeight.bold,
                          color: redColor,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          sections[i]['expanded'] ? Icons.remove : Icons.add,
                          color: redColor,
                        ),
                        onPressed: () {
                          setState(() {
                            sections[i]['expanded'] = !sections[i]['expanded'];
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  if (sections[i]['expanded'])
                    showColumns
                        ? IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    "In the name of the Father... (Section $i)",
                                    style: TextStyle(color: textColor, fontSize: fontSize),
                                  ),
                                ),
                                Container(width: 1.5, color: redColor, margin: const EdgeInsets.symmetric(horizontal: 8)),
                                Expanded(
                                  child: Text(
                                    "Ⲓⲛ ⲧⲉ ⲣⲁⲛ ⲛ̀ⲧⲉ Ⲡ̀ⲓⲱⲧ... (ⲥⲉⲕⲥⲓⲟⲛ $i)",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: textColor, fontSize: fontSize),
                                  ),
                                ),
                                Container(width: 1.5, color: redColor, margin: const EdgeInsets.symmetric(horizontal: 8)),
                                Expanded(
                                  child: Text(
                                    "باسم الآب والابن والروح القدس... (قسم $i)",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(color: textColor, fontSize: fontSize),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Text(
                            "In the name of the Father, Son and Holy Spirit... (Flat Section $i)",
                            style: TextStyle(color: textColor, fontSize: fontSize),
                          ),
                  const SizedBox(height: 20),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
