part of 'home_bloc.dart';

enum HomeStatus {
  initial,
  loading,
  success,
  error,
}

class HomeState extends Equatable {
  final HomeStatus status;
  final List<Meal> meals;
  final bool showCalendar;
  final DateTime _date;
  final String? errorMessage;

  DateTime get date => _date;

  HomeState({
    this.status = HomeStatus.initial,
    this.showCalendar = false,
    this.meals = const [],
    DateTime? date,
    this.errorMessage,
  }) : _date = date ?? DateTime.now();

  HomeState copyWith({
    HomeStatus? status,
    List<Meal>? meals,
    bool? showCalendar,
    DateTime? date,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      meals: meals ?? this.meals,
      showCalendar: showCalendar ?? this.showCalendar,
      date: date ?? this.date,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        meals,
        showCalendar,
        errorMessage,
      ];
}
