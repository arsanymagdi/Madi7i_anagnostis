import 'package:flutter/material.dart';

class DarkArHomeScreen extends StatelessWidget {
  const DarkArHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final List<Map<String, String>> menuItems = [
      {'img': 'AG.png', 'title': 'الأجبية'},
      {'img': 'BI.png', 'title': 'الكتاب المقدس'},
      {'img': 'ME.png', 'title': 'الألحان'},
      {'img': 'LI.png', 'title': 'القداسات'},
      {'img': 'PS.png', 'title': 'الإبصلمودية'},
      {'img': 'HW.png', 'title': 'أسبوع الآلام'},
      {'img': 'CE.png', 'title': 'الإكليروس'},
      {'img': 'RE.png', 'title': 'القراءات'},
      {'img': 'SP.png', 'title': 'مناسبات'},
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFF1C1C1C),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 30),
                Image.asset(
                  'assets/images/Drklogo.png',
                  width: screenWidth * 0.3,
                ),
                const SizedBox(height: 30),
                _libraryBox(context, screenWidth, menuItems, isArabic: true),
                const SizedBox(height: 20),
                _dateBox(screenWidth,
                    'الأربعاء، ١٦ يوليو ٢٠٢٥', 'Ⲡⲓⲟⲩⲟⲉⲓⲧ 9, 1741'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _libraryBox(BuildContext context, double width,
      List<Map<String, String>> items, {bool isArabic = false}) {
    return Container(
      width: width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFFF4545), width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white, width: 2),
            color: Colors.transparent,
          ),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                isArabic ? 'المكتبة' : 'Library',
                style: const TextStyle(
                  fontSize: 24,
                  fontFamily: 'RobotoSlab-SemiBold',
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.85,
                  ),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Column(
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
                          item['title']!,
                          style: const TextStyle(
                            fontSize: 12,
                            fontFamily: 'RobotoSlab-SemiBold',
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Text("⚙️", style: TextStyle(fontSize: 18)),
                label: const Text(
                  "الإعدادات",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: 'RobotoSlab-Regular',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF4545),
                  fixedSize: Size(width * 0.5, 52),
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
    );
  }

  Widget _dateBox(double width, String date, String copticDate) {
    return Container(
      width: width * 0.9,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFF4545),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            date,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'RobotoSlab-Regular',
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            copticDate,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'RobotoSlab-Regular',
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
