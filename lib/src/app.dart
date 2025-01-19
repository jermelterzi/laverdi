import 'package:flutter/material.dart';
import 'package:laverdi/src/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: MaterialTheme.lightScheme()),
      title: 'LaVerdi',
    );
  }
}
