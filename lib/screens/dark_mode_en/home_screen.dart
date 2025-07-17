// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

class DarkEnHomeScreen extends StatelessWidget {
  const DarkEnHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final List<Map<String, String>> menuItems = [
      {'img': 'AG.png', 'title': 'Agpeya'},
      {'img': 'BI.png', 'title': 'Bible'},
      {'img': 'ME.png', 'title': 'Melodies'},
      {'img': 'LI.png', 'title': 'Liturgies'},
      {'img': 'PS.png', 'title': 'Psalmody'},
      {'img': 'HW.png', 'title': 'Holy Week'},
      {'img': 'CE.png', 'title': 'Clergy'},
      {'img': 'RE.png', 'title': 'Readings'},
      {'img': 'SP.png', 'title': 'Special'},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1C),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              // Logo
              Image.asset(
                'assets/images/Drklogo.png',
                width: screenWidth * 0.3,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 30),
              // Outer Box
              Container(
                width: screenWidth * 0.9,
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
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          'Library',
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'RobotoSlab-SemiBold',
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Grid
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: menuItems.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              childAspectRatio: 0.85,
                            ),
                            itemBuilder: (context, index) {
                              final item = menuItems[index];
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
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Settings Button
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Text("⚙️", style: TextStyle(fontSize: 18)),
                          label: const Text(
                            "Settings",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontFamily: 'RobotoSlab-Regular',
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF4545),
                            fixedSize: Size(screenWidth * 0.5, 52),
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
              // Date Box
              Container(
                width: screenWidth * 0.9,
                padding: const EdgeInsets.all(12),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
