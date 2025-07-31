import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/app_provider.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, appProvider, _) {
        final isDark = appProvider.isDarkTheme;

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Madi7i Anagnostis',
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          theme: ThemeData(
            fontFamily: 'NotoSerifBengali',
            useMaterial3: true,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFFFF4545),
              foregroundColor: Colors.white,
            ),
            colorScheme: ColorScheme.light(
              primary: const Color(0xFFFF4545),
            ),
          ),
          darkTheme: ThemeData(
            fontFamily: 'NotoSerifBengali',
            useMaterial3: true,
            scaffoldBackgroundColor: Colors.black,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
            ),
            colorScheme: ColorScheme.dark(
              primary: const Color(0xFFFF4545),
            ),
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}
