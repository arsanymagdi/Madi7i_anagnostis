import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import 'white_mode_en/greeting_screen.dart';
import 'dark_mode_en/greeting_screen.dart';

class ChooseModeScreenEn extends StatelessWidget {
  const ChooseModeScreenEn({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context, listen: false);
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
          // Top content: Logo and text
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
                  'Choose',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontFamily: 'NotoSerifBengali-ExtraBold',
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Appearance',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontFamily: 'NotoSerifBengali-ExtraBold',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          // Black square container with buttons
          Container(
            width: double.infinity,
            height: screenHeight * 0.45, // less than before
            color: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const Spacer(), // push buttons down
                SizedBox(
                  width: buttonWidth,
                  height: buttonHeight,
                  child: ElevatedButton(
                    onPressed: () {
                      provider.setLanguage('en');
                      provider.setThemeMode('light');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const WhiteEnGreetingScreen(),
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
                      'Light Mode',
                      style: TextStyle(
                        fontSize: buttonFontSize,
                        fontFamily: 'RobotoSlab-Regular',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: buttonWidth,
                  height: buttonHeight,
                  child: ElevatedButton(
                    onPressed: () {
                      provider.setLanguage('en');
                      provider.setThemeMode('dark');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const DarkEnGreetingScreen(),
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
                      'Dark Mode',
                      style: TextStyle(
                        fontSize: buttonFontSize,
                        fontFamily: 'RobotoSlab-Regular',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30), // spacing before bottom edge
              ],
            ),
          ),
        ],
      ),
    );
  }
}
