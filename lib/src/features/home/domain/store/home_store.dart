import 'package:laverdi/src/features/home/domain/models/meal.dart';
import 'package:laverdi/src/shared/interfaces/repository.dart';

class HomeStore {
  HomeStore({
    required this.repository,
  });
  bool _isCalendarActive = false;
  final Repository repository;

  Stream<List<Meal>> loadMeals(DateTime date) async* {
    yield repository.fetchAll() as List<Meal>;
  }

  Stream<bool> showCalendar() async* {
    _isCalendarActive = !_isCalendarActive;
    yield _isCalendarActive;
  }
}
