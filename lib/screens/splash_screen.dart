import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import 'choose_language_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final isArabic = provider.language == 'ar';

    final verse = isArabic
        ? 'إِلهَ السَّمَاءِ يُعْطِينَا النَّجَاحَ، وَنَحْنُ عَبِيدُهُ نَقُومُ وَنَبْنِي.\n(نحميا ٢:٢٠)'
        : 'The God of heaven will give us success.\nWe his servants will start rebuilding.\n(Nehemiah 2:20)';

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const ChooseLanguageScreen()),
          );
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Image.asset(
                  'assets/images/image 2-1.png',
                  width: MediaQuery.of(context).size.width * 0.45,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 40),

                // Verse
                Text(
                  verse,
                  textAlign: TextAlign.center,
                  textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: isArabic ? 'Cairo' : 'NotoSerifBengali',
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800],
                    height: 1.6,
                  ),
                ),

                const SizedBox(height: 50),

                // Hint
                Text(
                  isArabic ? 'اضغط للمتابعة' : 'Tap to here',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: isArabic ? 'Cairo' : 'NotoSerifBengali',
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
