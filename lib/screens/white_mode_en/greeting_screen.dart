import 'package:flutter/material.dart';
import 'home_screen.dart'; // Assuming it's in the same folder

class WhiteEnGreetingScreen extends StatelessWidget {
  const WhiteEnGreetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    final titleFontSize = screenWidth < 400 ? 26.0 : 32.0;
    final subtitleFontSize = screenWidth < 400 ? 16.0 : 18.0;
    final buttonWidth = screenWidth < 400 ? 260.0 : 290.0;
    final buttonHeight = screenWidth < 400 ? 40.0 : 60.0;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          const SizedBox(height: 60), // Cross lower than before

          // Cross icon
          Center(
            child: Image.asset(
              'assets/images/image4.png',
              height: 70,
              width: 70,
              fit: BoxFit.contain,
            ),
          ),

          const Spacer(),

          // Curved arc container
          Container(
            height: screenHeight * 0.75,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFEEDFB7),
              borderRadius: BorderRadius.vertical(
                top: Radius.elliptical(1000, 500), // More curved
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
                  'Welcome To Madi7i',
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NotoSerifBengali-SemiBold',
                    color: const Color(0xFF1C1C1C),
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 12),

                Text(
                  'Let your heart sing',
                  style: TextStyle(
                    fontSize: subtitleFontSize,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'RobotoSlab-Regular',
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
                          builder: (_) => const HomeScreen(),
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
                          'Continue',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: 'RobotoSlab-Regular',
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
    );
  }
}
