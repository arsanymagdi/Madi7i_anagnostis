import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import 'document_page.dart';

class ListPage extends StatelessWidget {
  final String category;

  const ListPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final isDark = provider.themeMode == 'dark';
    final isArabic = provider.language == 'ar';

    final screenW = MediaQuery.of(context).size.width;

    // Labels depending on language
    final titleText = isArabic ? 'أسبوع الآلام' : 'Holy Week';
    final itemTitles = isArabic
        ? ['أحد الشعانين', 'خميس العهد', 'الجمعة العظيمة', 'سبت النور']
        : ['Palm Sunday', 'Covenant Thursday', 'Good Friday', 'Bright Saturday'];

    final items = [
      {'img': 'PS.png', 'title': itemTitles[0]},
      {'img': 'HW.png', 'title': itemTitles[1]},
      {'img': 'LI.png', 'title': itemTitles[2]},
      {'img': 'AG.png', 'title': itemTitles[3]},
    ];

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF1C1C1C) : Colors.white,
      body: Center(
        child: Container(
          width: screenW * 0.9,
          margin: const EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFFF4545), width: 3),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: isDark ? Colors.white : Colors.black, width: 2),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    // Header with back and title
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back,
                                color: isDark ? Colors.white : Colors.black),
                            onPressed: () => Navigator.pop(context),
                          ),
                          const SizedBox(width: 4),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                titleText,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'RobotoSlab-Bold',
                                  color: isDark ? Colors.white : Colors.black,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Container(
                                height: 2,
                                width: 100,
                                color: const Color(0xFFFF4545),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Items list
                    Expanded(
                      child: ListView.builder(
                        itemCount: items.length,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemBuilder: (context, index) {
                          final it = items[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => DocumentPage(title: it['title']!),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xFFFF4545), width: 2),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        'assets/images/${it['img']}',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Text(
                                    it['title']!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'RobotoSlab-SemiBold',
                                      color: isDark ? Colors.white : Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
