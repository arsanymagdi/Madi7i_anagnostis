import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import 'list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final isDark = provider.themeMode == 'dark';
    final isArabic = provider.language == 'ar';
    final size = MediaQuery.of(context).size;
    final isLandscape = size.width > size.height;

    final backgroundColor = isDark ? const Color(0xFF1C1C1C) : Colors.white;
    final textColor = isDark ? Colors.white : const Color(0xFF1C1C1C);
    final borderColor = const Color(0xFFFF4545);
    final boxColor = borderColor;

    final menuItems = [
      {'img': 'AG.png', 'title_en': 'Agpeya', 'title_ar': 'الأجبية'},
      {'img': 'BI.png', 'title_en': 'Bible', 'title_ar': 'الكتاب المقدس'},
      {'img': 'ME.png', 'title_en': 'Melodies', 'title_ar': 'الألحان'},
      {'img': 'LI.png', 'title_en': 'Liturgies', 'title_ar': 'القداسات'},
      {'img': 'PS.png', 'title_en': 'Psalmody', 'title_ar': 'الإبصلمودية'},
      {'img': 'HW.png', 'title_en': 'Holy Week', 'title_ar': 'أسبوع الآلام'},
      {'img': 'CE.png', 'title_en': 'Clergy', 'title_ar': 'الإكليروس'},
      {'img': 'SP.png', 'title_en': 'Special', 'title_ar': 'مختارات'},
      {'img': 'RE.png', 'title_en': 'Readings', 'title_ar': 'القراءات'},
    ];

    String translate(String en, String ar) => isArabic ? ar : en;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Directionality(
          textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
          child: isLandscape
              ? Row(
                  children: [
                    Container(
                      width: size.width * 0.35,
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/Drklogo.png',
                            width: size.width * 0.15,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 12),
                          _buildSettingsButton(boxColor, translate, large: false),
                          const Spacer(),
                          _buildDateBox(boxColor, translate, portrait: false),
                        ],
                      ),
                    ),
                    Expanded(
                      child: _buildLibraryGrid(
                        context,
                        menuItems,
                        isDark,
                        textColor,
                        borderColor,
                        isArabic,
                        5,
                        translate,
                        boxColor,
                        portrait: false,
                      ),
                    ),
                  ],
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Image.asset(
                        'assets/images/Drklogo.png',
                        width: size.width * 0.3,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 20),
                      _buildLibraryGrid(
                        context,
                        menuItems,
                        isDark,
                        textColor,
                        borderColor,
                        isArabic,
                        3,
                        translate,
                        boxColor,
                        portrait: true,
                      ),
                      const SizedBox(height: 20),
                      _buildDateBox(boxColor, translate, portrait: true),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildLibraryGrid(
    BuildContext context,
    List<Map<String, String>> items,
    bool isDark,
    Color textColor,
    Color borderColor,
    bool isArabic,
    int crossAxisCount,
    String Function(String, String) translate,
    Color underlineColor,
    {required bool portrait}
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: isDark ? Colors.white : Colors.black, width: 2),
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment:
                    isArabic ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      translate('Library', 'المكتبة'),
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'RobotoSlab-SemiBold',
                        color: textColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    height: 2,
                    width: 80,
                    color: underlineColor,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.9,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: items.map((item) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ListPage(category: item['title_en']!),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(color: borderColor, width: 2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              'assets/images/${item['img']}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          translate(item['title_en']!, item['title_ar']!),
                          style: TextStyle(
                            fontSize: 11,
                            fontFamily: 'RobotoSlab-SemiBold',
                            color: textColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              if (portrait) ...[
                const SizedBox(height: 16),
                _buildSettingsButton(borderColor, translate, large: true),
              ]
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsButton(
    Color backgroundColor,
    String Function(String, String) translate, {
    required bool large,
  }) {
    return ElevatedButton.icon(
      onPressed: () {
        // TODO: Navigate to settings screen
      },
      icon: const Text("⚙️", style: TextStyle(fontSize: 20)),
      label: Text(
        translate("Settings", "الإعدادات"),
        style: TextStyle(
          fontSize: large ? 20 : 16,
          fontFamily: 'RobotoSlab-Regular',
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: large ? 24 : 16, vertical: large ? 16 : 12),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0,
      ),
    );
  }

  Widget _buildDateBox(
    Color backgroundColor,
    String Function(String, String) translate, {
    required bool portrait,
  }) {
    return Container(
      width: portrait ? double.infinity : null,
      margin: EdgeInsets.symmetric(horizontal: portrait ? 40 : 0),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: portrait ? 24 : 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            translate("Wednesday, July 16, 2025", "الأربعاء ١٦ يوليو ٢٠٢٥"),
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'RobotoSlab-Regular',
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Ⲡⲓⲟⲩⲟⲉⲓⲧ 9, 1741',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'RobotoSlab-Regular',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
