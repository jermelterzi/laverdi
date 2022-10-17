import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/meal.dart';

class HomeStore {
  final List<Meal> _meals = [];
  bool _isCalendarActive = false;

  Stream<List<Meal>> loadMeals(DateTime date) async* {
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
    yield _meals;
  }

  Stream<bool> showCalendar() async* {
    _isCalendarActive = !_isCalendarActive;
    yield _isCalendarActive;
  }
}
