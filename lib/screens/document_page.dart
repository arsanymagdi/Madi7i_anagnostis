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

  // Create GlobalKeys for each section to scroll to
  final List<GlobalKey> sectionKeys = List.generate(5, (_) => GlobalKey());

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

    final primaryColor = const Color(0xFFFF4545);
    final textColor = isDark ? Colors.white : Colors.black;
    final bgColor = isDark ? const Color(0xFF1C1C1C) : Colors.white;

    return Directionality(
      textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: bgColor,
        drawer: Drawer(
          backgroundColor: bgColor,
          child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: primaryColor.withOpacity(0.2)),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    isAr ? 'القائمة' : 'Navigator',
                    style: TextStyle(color: textColor, fontSize: 20),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
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
                    ListTile(
                      leading: Icon(Icons.list_alt, color: textColor),
                      title: Text(isAr ? 'جدول المحتويات' : 'Table of Contents', style: TextStyle(color: textColor)),
                      onTap: () {
                        Navigator.pop(context); // close drawer
                        Scaffold.of(context).openEndDrawer(); // open endDrawer
                      },
                    ),
                  ],
                ),
              ),
              const Divider(),
              Align(
                alignment: Alignment.bottomCenter,
                child: ListTile(
                  leading: Icon(Icons.settings, color: textColor),
                  title: Text(isAr ? 'الإعدادات' : 'Settings', style: TextStyle(color: textColor)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SettingsScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        // END Drawer (Table of Contents)
        endDrawer: Drawer(
          backgroundColor: bgColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: primaryColor.withOpacity(0.2)),
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
                    final keyContext = sectionKeys[i].currentContext;
                    if (keyContext != null) {
                      Scrollable.ensureVisible(
                        keyContext,
                        duration: const Duration(milliseconds: 300),
                      );
                    }
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
                Container(height: 2, width: 80, color: primaryColor),
                const SizedBox(height: 20),

                for (int i = 0; i < sections.length; i++) ...[
                  Container(
                    key: sectionKeys[i],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              sections[i]['title'],
                              style: TextStyle(
                                fontSize: fontSize + 2,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                sections[i]['expanded'] ? Icons.remove : Icons.add,
                                color: primaryColor,
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
                          _buildColumns(context, provider, fontSize, textColor, primaryColor, i),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildColumns(BuildContext context, AppProvider provider, double fontSize, Color textColor, Color primaryColor, int index) {
    final columns = <Widget>[];

    if (provider.showEnglishColumn) {
      columns.add(
        Expanded(
          child: Text(
            "In the name of the Father... (Section $index)",
            style: TextStyle(color: textColor, fontSize: fontSize),
          ),
        ),
      );
    }

    if (provider.showEnglishColumn && (provider.showArabicColumn || provider.showCopticColumn)) {
      columns.add(_divider(primaryColor));
    }

    if (provider.showCopticColumn) {
      columns.add(
        Expanded(
          child: Text(
            "Ⲓⲛ ⲧⲉ ⲣⲁⲛ ⲛ̀ⲧⲉ Ⲡ̀ⲓⲱⲧ... ($index)",
            textAlign: TextAlign.center,
            style: TextStyle(color: textColor, fontSize: fontSize),
          ),
        ),
      );
    }

    if (provider.showCopticColumn && provider.showArabicColumn) {
      columns.add(_divider(primaryColor));
    }

    if (provider.showArabicColumn) {
      columns.add(
        Expanded(
          child: Text(
            "باسم الآب والابن والروح القدس... (قسم $index)",
            textAlign: TextAlign.right,
            style: TextStyle(color: textColor, fontSize: fontSize),
          ),
        ),
      );
    }

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: columns,
      ),
    );
  }

  Widget _divider(Color color) {
    return Container(
      width: 1.5,
      color: color,
      margin: const EdgeInsets.symmetric(horizontal: 8),
    );
  }
}
