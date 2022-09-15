import 'dart:async';

import 'package:laverdi/src/features/home/bloc/home_events.dart';
import 'package:laverdi/src/features/home/bloc/home_state.dart';
import 'package:laverdi/src/features/home/services/home_controller.dart';

import '../models/meal.dart';

class HomeBloc {
  final _homeController = HomeController();
  final StreamController<HomeEvent> _inputHomeController =
      StreamController<HomeEvent>.broadcast();
  final StreamController<HomeState> _outputHomeController =
      StreamController<HomeState>.broadcast();

  Sink<HomeEvent> get inputEvent => _inputHomeController.sink;
  Stream<HomeState> get stream => _outputHomeController.stream;

  HomeBloc() {
    _inputHomeController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(HomeEvent event) {
    List<Meal> meals = [];

    if (event is LoadMealsEvent) {
      meals = _homeController.loadMeals();
    } else if (event is ShowCalendarEvent) {
      _homeController.showCalendar();
    }
    _outputHomeController.add(HomeSucessState(meals: meals));
  }
}
