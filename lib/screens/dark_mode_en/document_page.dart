import 'package:flutter/material.dart';

class DocumentPage extends StatelessWidget {
  final String title;

  const DocumentPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    // Define section keys for scroll-to-section logic
    final sectionKeys = List.generate(5, (_) => GlobalKey());

    final sections = [
      'Ⲡ̀ⲣⲟⲉⲩⲭⲏ',
      'Gospel',
      'Ⲡ̀ⲛⲉⲩⲙⲁ',
      'Ⲧⲁⲅⲓⲟⲛ',
      'Conclusion',
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1C),

// 🧭 LEFT DRAWER (with scroll fix)
drawer: Drawer(
  backgroundColor: const Color(0xFF1C1C1C),
  child: SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(color: Colors.black87),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Navigator',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),

        // 📅 Calendar
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFFF4545),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Column(
            children: [
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
        ),

        const Divider(color: Colors.grey),

        ListTile(
          leading: const Icon(Icons.home, color: Colors.white),
          title: const Text('Home', style: TextStyle(color: Colors.white)),
          onTap: () => Navigator.popUntil(context, (route) => route.isFirst),
        ),
        ListTile(
          leading: const Icon(Icons.arrow_back, color: Colors.white),
          title: const Text('Back', style: TextStyle(color: Colors.white)),
          onTap: () => Navigator.pop(context),
        ),
        const Divider(color: Colors.grey),

        ListTile(
          leading: const Icon(Icons.settings, color: Colors.white),
          title: const Text('Settings', style: TextStyle(color: Colors.white)),
          onTap: () {
            // settings
          },
        ),
      ],
    ),
  ),
),

      // 📚 RIGHT DRAWER (TABLE OF CONTENTS)
      endDrawer: Drawer(
        backgroundColor: const Color(0xFF1C1C1C),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.black87),
              child: Text(
                'Table of Contents',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            for (int i = 0; i < sections.length; i++) ...[
              ListTile(
                title: Text(
                  sections[i],
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
                onTap: () {
                  Navigator.pop(context); // close drawer
                  Scrollable.ensureVisible(
                    sectionKeys[i].currentContext!,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              const Divider(color: Colors.grey),
            ],
          ],
        ),
      ),

      // 📄 MAIN BODY
      body: SafeArea(
        child: SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title with underline
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontFamily: 'RobotoSlab-Bold',
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              Container(
                height: 2,
                width: 80,
                color: Color(0xFFFF4545),
              ),
              const SizedBox(height: 20),

              // 📄 SECTIONS
              for (int i = 0; i < sections.length; i++)
                Padding(
                  key: sectionKeys[i],
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Section title
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
                            // ENGLISH
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "In the name of the Father, Son and Holy Spirit... (Section $i)",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'RobotoSlab-Regular',
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Blessed is He who comes in the name of the Lord... Amen.",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // 🔴 VERTICAL RED DIVIDER (full height)
                            Container(
                              width: 1.5,
                              color: Color(0xFFFF4545),
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                            ),

                            // COPTIC
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Ⲓⲛ ⲧⲉ ⲣⲁⲛ ⲛ̀ⲧⲉ Ⲡ̀ⲓⲱⲧ... (ⲥⲉⲕⲥⲓⲟⲛ $i)",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'RobotoSlab-Regular',
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Ⲡⲓⲉⲩⲱⲧ ⲉⲑⲛⲁⲩ ⲉ̀ⲡ̀ⲣⲁⲛ ⲛ̀Ⲫⲓⲱⲧ...",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),

                            // 🔴 VERTICAL RED DIVIDER
                            Container(
                              width: 1.5,
                              color: Color(0xFFFF4545),
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                            ),

                            // ARABIC
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "باسم الآب والابن والروح القدس... (قسم $i)",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'RobotoSlab-Regular',
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "مبارك الآتي باسم الرب...",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
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
    );
  }
}
