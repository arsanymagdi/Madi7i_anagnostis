import 'package:flutter/material.dart';
import 'list.dart'; // Import your ListPage

class DarkEnHomeScreen extends StatelessWidget {
  const DarkEnHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape = size.width > size.height;

    final menuItems = [
      {'img': 'AG.png', 'title': 'Agpeya'},
      {'img': 'BI.png', 'title': 'Bible'},
      {'img': 'ME.png', 'title': 'Melodies'},
      {'img': 'LI.png', 'title': 'Liturgies'},
      {'img': 'PS.png', 'title': 'Psalmody'},
      {'img': 'HW.png', 'title': 'Holy Week'},
      {'img': 'CE.png', 'title': 'Clergy'},
      {'img': 'SP.png', 'title': 'Special'},
      {'img': 'RE.png', 'title': 'Readings'},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1C),
      body: SafeArea(
        child: isLandscape
            ? Row(
                children: [
                  // LEFT SIDE
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
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 0,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(bottom: 10),
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
                      ],
                    ),
                  ),

                  // RIGHT SIDE: Library
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
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              const Text(
                                'Library',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'RobotoSlab-SemiBold',
                                  color: Colors.white,
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
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => ListPage(
                                              category: item['title']!,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 60,
                                            height: 60,
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
                                              fontSize: 11,
                                              fontFamily: 'RobotoSlab-SemiBold',
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    );
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
                    Center(
                      child: Container(
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
                              border: Border.all(color: Colors.white, width: 2),
                              color: Colors.transparent,
                            ),
                            child: Column(
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
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => ListPage(
                                                category: item['title']!,
                                              ),
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
                                              item['title']!,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'RobotoSlab-SemiBold',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton.icon(
                                  onPressed: () {},
                                  icon:
                                      const Text("⚙️", style: TextStyle(fontSize: 18)),
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
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: size.width * 0.9,
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
                    const SizedBox(height: 20),
                  ],
                ),
              ),
      ),
    );
  }
}
