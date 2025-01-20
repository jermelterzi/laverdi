import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:laverdi/src/app.dart';

Future<void> main() async {
  await Hive.initFlutter();

  runApp(const App());
}
