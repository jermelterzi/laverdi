import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:laverdi/pages/splash_page.dart';
import 'package:laverdi/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LaVerdi',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', ''),
      ],
      theme: ThemeData(
        fontFamily: 'Fahkwang',
      ).copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: const Color(0xFF8CA87C),
              secondary: HSLColor.fromColor(const Color(0xFF414B3B))
                  .withLightness(0.5)
                  .toColor(),
            ),
      ),
      routes: {
        AppRoutes.SPLASH_PAGE: (ctx) => const SplashPage(),
      },
    );
  }
}
