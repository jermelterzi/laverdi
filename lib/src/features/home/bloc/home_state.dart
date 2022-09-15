// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../models/meal.dart';

abstract class HomeState {
  List<Meal> meals;

  HomeState({
    required this.meals,
  });
}

class HomeInitialState extends HomeState {
  HomeInitialState() : super(meals: []);
}

class HomeSucessState extends HomeState {
  HomeSucessState({required List<Meal> meals}) : super(meals: meals);
}
