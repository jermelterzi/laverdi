import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/meal.dart';

class HomeController {
  final List<Meal> _meals = [];
  bool _isCalendarActive = false;

  List<Meal> loadMeals() {
    _meals.addAll([
      Meal(
        name: 'CAFÉ DA MANHÃ',
        icon: FontAwesomeIcons.cloudSun,
      ),
      Meal(
        name: 'ALMOÇO',
        icon: FontAwesomeIcons.solidSun,
      ),
      Meal(
        name: 'JANTAR',
        icon: FontAwesomeIcons.solidMoon,
      )
    ]);
    return _meals;
  }

  bool showCalendar() {
    _isCalendarActive = !_isCalendarActive;
    return _isCalendarActive;
  }
}
