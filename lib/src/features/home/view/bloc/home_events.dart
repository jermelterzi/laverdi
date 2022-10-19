part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class LoadMealsEvent extends HomeEvent {
  const LoadMealsEvent({required this.date});
  final DateTime date;

  @override
  List<Object?> get props => [date];
}

class ShowCalendarEvent extends HomeEvent {
  const ShowCalendarEvent();
}
