import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import 'list.dart'; // Your ListPage

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final isArabic = provider.language == 'ar';
    final theme = Theme.of(context);
    final isDark = provider.themeMode == 'dark';

    final size = MediaQuery.of(context).size;
    final isLandscape = size.width > size.height;

    final menuItems = [
      {'img': 'AG.png', 'en': 'Agpeya', 'ar': 'الأجبية'},
      {'img': 'BI.png', 'en': 'Bible', 'ar': 'الكتاب المقدس'},
      {'img': 'ME.png', 'en': 'Melodies', 'ar': 'الألحان'},
      {'img': 'LI.png', 'en': 'Liturgies', 'ar': 'القداسات'},
      {'img': 'PS.png', 'en': 'Psalmody', 'ar': 'الإبصلمودية'},
      {'img': 'HW.png', 'en': 'Holy Week', 'ar': 'أسبوع الآلام'},
      {'img': 'CE.png', 'en': 'Clergy', 'ar': 'الاكليروس'},
      {'img': 'SP.png', 'en': 'Special', 'ar': 'مناسبات خاصة'},
      {'img': 'RE.png', 'en': 'Readings', 'ar': 'القراءات'},
    ];

    final backgroundColor = theme.scaffoldBackgroundColor;
    final primaryTextColor = isDark ? Colors.white : Colors.black;

    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: isLandscape
              ? _buildLandscapeLayout(context, menuItems, size, isArabic, isDark, primaryTextColor)
              : _buildPortraitLayout(context, menuItems, size, isArabic, isDark, primaryTextColor),
        ),
      ),
    );
  }

  Widget _buildLandscapeLayout(
    BuildContext context,
    List<Map<String, String>> menuItems,
    Size size,
    bool isArabic,
    bool isDark,
    Color textColor,
  ) {
    return Row(
      children: [
        // LEFT SIDE
        Container(
          width: size.width * 0.35,
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Image.asset(
                isDark ? 'assets/images/Drklogo.png' : 'assets/images/Drklogo.png',
                width: size.width * 0.15,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Text("⚙️", style: TextStyle(fontSize: 18)),
                label: Text(
                  isArabic ? 'الإعدادات' : 'Settings',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: 'RobotoSlab-Regular',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF4545),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
              ),
              const Spacer(),
              _buildDateBox(textColor),
            ],
          ),
        ),

        // RIGHT SIDE
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFFF4545), width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: textColor, width: 2),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      isArabic ? 'المكتبة' : 'Library',
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'RobotoSlab-SemiBold',
                        color: textColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 5,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.9,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        children: menuItems.map((item) {
                          return _buildMenuItem(context, item, isArabic, textColor);
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPortraitLayout(
    BuildContext context,
    List<Map<String, String>> menuItems,
    Size size,
    bool isArabic,
    bool isDark,
    Color textColor,
  ) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 30),
          Image.asset(
            isDark ? 'assets/images/Drklogo.png' : 'assets/images/Drklogo.png',
            width: size.width * 0.3,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          Container(
            width: size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFFF4545), width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: textColor, width: 2),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      isArabic ? 'المكتبة' : 'Library',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'RobotoSlab-SemiBold',
                        color: textColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.85,
                        children: menuItems.map((item) {
                          return _buildMenuItem(context, item, isArabic, textColor);
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Text("⚙️", style: TextStyle(fontSize: 18)),
                      label: Text(
                        isArabic ? 'الإعدادات' : 'Settings',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'RobotoSlab-Regular',
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF4545),
                        fixedSize: Size(size.width * 0.5, 52),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          _buildDateBox(textColor),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    Map<String, String> item,
    bool isArabic,
    Color textColor,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ListPage(category: item['en']!),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFFFF4545),
                width: 2,
              ),
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
            isArabic ? item['ar']! : item['en']!,
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'RobotoSlab-SemiBold',
              color: textColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDateBox(Color textColor) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFFF4545),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: const [
          Text(
            'Wednesday, July 16, 2025',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'RobotoSlab-Regular',
              color: Colors.white,
            ),
          ),
          SizedBox(height: 6),
          Text(
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
