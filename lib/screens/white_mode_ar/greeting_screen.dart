import 'package:flutter/material.dart';
import 'home_screen.dart'; // Make sure this file exists in the same folder

class WhiteArGreetingScreen extends StatelessWidget {
  const WhiteArGreetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    final titleFontSize = screenWidth < 400 ? 26.0 : 32.0;
    final subtitleFontSize = screenWidth < 400 ? 16.0 : 18.0;
    final buttonWidth = screenWidth < 400 ? 260.0 : 290.0;
    final buttonHeight = screenWidth < 400 ? 40.0 : 60.0;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: Column(
          children: [
            const SizedBox(height: 60),

            // Cross icon
            Center(
              child: Image.asset(
                'assets/images/image4.png',
                height: 70,
                width: 70,
              ),
            ),

            const Spacer(),

            // Arc container
            Container(
              height: screenHeight * 0.75,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFEEDFB7),
                borderRadius: BorderRadius.vertical(
                  top: Radius.elliptical(1000, 500),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),

                  // Logo
                  Image.asset(
                    'assets/images/image 2-1.png',
                    height: 120,
                    width: 120,
                    fit: BoxFit.contain,
                  ),

                  const SizedBox(height: 30),

                  Text(
                    'أهلاً بك في مديحي',
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cairo',
                      color: const Color(0xFF1C1C1C),
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 12),

                  Text(
                    'دع قلبك يرنم',
                    style: TextStyle(
                      fontSize: subtitleFontSize,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Cairo',
                      color: const Color(0xFF1C1C1C),
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 40),

                  SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const WhiteArHomeScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF4545),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'استمرار',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontFamily: 'Cairo',
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
