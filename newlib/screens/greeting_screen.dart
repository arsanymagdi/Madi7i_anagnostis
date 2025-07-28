import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import 'home_screen.dart'; // Handles both WhiteEnHomeScreen and DarkEnHomeScreen

class GreetingScreen extends StatelessWidget {
  const GreetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final isArabic = provider.language == 'ar';
    final isDark = provider.themeMode == 'dark';

    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    final titleFontSize = screenWidth < 400 ? 26.0 : 32.0;
    final subtitleFontSize = screenWidth < 400 ? 16.0 : 18.0;
    final buttonWidth = screenWidth < 400 ? 260.0 : 290.0;
    final buttonHeight = screenWidth < 400 ? 40.0 : 60.0;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF1C1C1C) : const Color(0xFFF5F5F5),
      body: Column(
        children: [
          const SizedBox(height: 60),

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

          // Arc container
          Container(
            height: screenHeight * 0.75,
            width: double.infinity,
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF2A2A2A) : const Color(0xFFEEDFB7),
              borderRadius: const BorderRadius.vertical(
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
                  isArabic ? 'مرحبًا بك في مديحي' : 'Welcome To Madi7i',
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                    fontFamily: isArabic ? 'Cairo' : 'NotoSerifBengali-SemiBold',
                    color: isDark ? Colors.white : const Color(0xFF1C1C1C),
                  ),
                  textAlign: TextAlign.center,
                  textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
                ),

                const SizedBox(height: 12),

                Text(
                  isArabic ? 'دَعْ قلبك يُرنم' : 'Let your heart sing',
                  style: TextStyle(
                    fontSize: subtitleFontSize,
                    fontWeight: FontWeight.w500,
                    fontFamily: isArabic ? 'Cairo' : 'RobotoSlab-Regular',
                    color: isDark ? Colors.white : const Color(0xFF1C1C1C),
                  ),
                  textAlign: TextAlign.center,
                  textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          isArabic ? 'متابعة' : 'Continue',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: isArabic ? 'Cairo' : 'RobotoSlab-Regular',
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.arrow_forward, color: Colors.white),
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
