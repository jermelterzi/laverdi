import 'package:flutter/material.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Fahkwang',
      ),
      routes: {
        AppRoutes.SPLASH_PAGE: (ctx) => const SplashPage(),
      },
    );
  }
}
