import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import 'white_mode_ar/greeting_screen.dart';
import 'dark_mode_ar/greeting_screen.dart';

class ChooseModeArScreen extends StatelessWidget {
  const ChooseModeArScreen({super.key});

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

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
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
                    'اختر',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontFamily: 'NotoSerifBengali-ExtraBold',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'المظهر',
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

            // Bottom black square with buttons
            Container(
              width: double.infinity,
              height: screenHeight * 0.45,
              color: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const Spacer(),
                  SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: ElevatedButton(
                      onPressed: () {
                        provider.setLanguage('ar');
                        provider.setThemeMode('light');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const WhiteArGreetingScreen(),
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
                        'الوضع الفاتح',
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
                        provider.setLanguage('ar');
                        provider.setThemeMode('dark');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const DarkArGreetingScreen(),
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
                        'الوضع الداكن',
                        style: TextStyle(
                          fontSize: buttonFontSize,
                          fontFamily: 'RobotoSlab-Regular',
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
      ),
    );
  }
}
