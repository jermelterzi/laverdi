import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laverdi/src/features/home/domain/models/meal.dart';
import 'package:laverdi/src/shared/interfaces/local_data_source.dart';

class HomeLocalDataSource implements LocalDataSource {
  final List<Meal> _meals = [
    Meal(
      id: '1',
      name: 'CAFÉ DA MANHÃ',
      icon: FontAwesomeIcons.cloudSun.codePoint,
    ),
    Meal(
      id: '2',
      name: 'ALMOÇO',
      icon: FontAwesomeIcons.solidSun.codePoint,
    ),
    Meal(
      id: '3',
      name: 'JANTAR',
      icon: FontAwesomeIcons.solidMoon.codePoint,
    )
  ];

  List<Meal> get meals => _meals;
}
