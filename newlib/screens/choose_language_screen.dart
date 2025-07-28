import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import 'choose_mode_en_screen.dart';


class ChooseLanguageScreen extends StatelessWidget {
  const ChooseLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;

    final titleFontSize = screenWidth < 400 ? 24.0 : 30.0;
    final buttonFontSize = screenWidth < 400 ? 16.0 : 18.0;
    final buttonWidth = screenWidth < 400 ? 260.0 : 290.0;
    final buttonHeight = screenWidth < 400 ? 42.0 : 56.0;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          children: [
            // Top Bulb Area
            Container(
              height: screenHeight * 0.55,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFEEDFB7),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(1000, 360),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Choose Language',
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'NotoSerifBengali-SemiBold',
                      color: const Color(0xFF1C1C1C),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'اختار اللغة',
                    style: TextStyle(
                      fontSize: titleFontSize - 2,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Cairo',
                      color: const Color(0xFF1C1C1C),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Image.asset(
                    'assets/images/image 2-1.png',
                    height: screenWidth < 400 ? 180 : 220,
                    width: screenWidth < 400 ? 180 : 220,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Bottom Buttons
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Column(
                children: [
                  SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: ElevatedButton(
                      onPressed: () async {
                        provider.setLanguage('en');
                        if (!context.mounted) return;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ChooseModeScreen(),
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
                        'English',
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
                      onPressed: () async {
                        provider.setLanguage('ar');
                        if (!context.mounted) return;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ChooseModeScreen(),
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
                        'العربية',
                        style: TextStyle(
                          fontSize: buttonFontSize,
                          fontFamily: 'RobotoSlab-Regular',
                          color: Colors.white,
                        ),
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
