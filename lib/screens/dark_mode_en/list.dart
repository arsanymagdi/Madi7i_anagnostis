import 'package:flutter/material.dart';
import 'document_page.dart';

class ListPage extends StatelessWidget {
  final String category;

  const ListPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;

    final items = [
      {'img': 'PS.png', 'title': 'Palm Sunday'},
      {'img': 'HW.png', 'title': 'Covenant Thursday'},
      {'img': 'LI.png', 'title': 'Good Friday'},
      {'img': 'AG.png', 'title': 'Bright Saturday'},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1C),
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
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    // Title Row with Back Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () => Navigator.pop(context),
                          ),
                          const SizedBox(width: 4),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Holy Week',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'RobotoSlab-Bold',
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Container(
                                height: 2,
                                width: 100,
                                color: Color(0xFFFF4545),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 10),

                    // List Items
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
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'RobotoSlab-SemiBold',
                                      color: Colors.white,
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
