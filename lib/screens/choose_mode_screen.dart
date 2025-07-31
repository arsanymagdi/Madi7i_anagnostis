import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import 'greeting_screen.dart';

class ChooseModeScreen extends StatelessWidget {
  const ChooseModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final lang = provider.language;
    final isArabic = lang == 'ar';

    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    final logoSize = screenWidth < 400 ? 150.0 : 180.0;
    final titleFontSize = screenWidth < 400 ? 22.0 : 28.0;
    final buttonFontSize = screenWidth < 400 ? 16.0 : 18.0;
    final buttonWidth = screenWidth < 400 ? 260.0 : 290.0;
    final buttonHeight = screenWidth < 400 ? 40.0 : 60.0;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          // Top: Logo & Title
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/image 2-1.png',
                  height: logoSize,
                  width: logoSize,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 8),
                Text(
                  isArabic ? 'اختر' : 'Choose',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontFamily: isArabic ? 'Cairo' : 'NotoSerifBengali-ExtraBold',
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF1C1C1C), // <-- ADD THIS LINE
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  isArabic ? 'السمة' : 'Appearance',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontFamily: isArabic ? 'Cairo' : 'NotoSerifBengali-ExtraBold',
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF1C1C1C), // <-- ADD THIS LINE
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          // Bottom Panel with Buttons
          Container(
            width: double.infinity,
            height: screenHeight * 0.45,
            color: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const Spacer(),

                // Light Mode Button
                SizedBox(
                  width: buttonWidth,
                  height: buttonHeight,
                  child: ElevatedButton(
                    onPressed: () {
                      provider.setThemeMode('light');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => isArabic
                              ? const GreetingScreen()
                              : const GreetingScreen(),
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
                    child: Text(
                      isArabic ? 'الوضع الفاتح' : 'Light Mode',
                      style: TextStyle(
                        fontSize: buttonFontSize,
                        fontFamily: isArabic ? 'Cairo' : 'RobotoSlab-Regular',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Dark Mode Button
                SizedBox(
                  width: buttonWidth,
                  height: buttonHeight,
                  child: ElevatedButton(
                    onPressed: () {
                      provider.setThemeMode('dark');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => isArabic
                              ? const GreetingScreen()
                              : const GreetingScreen(),
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
                    child: Text(
                      isArabic ? 'الوضع الداكن' : 'Dark Mode',
                      style: TextStyle(
                        fontSize: buttonFontSize,
                        fontFamily: isArabic ? 'Cairo' : 'RobotoSlab-Regular',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
