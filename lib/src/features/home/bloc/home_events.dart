// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class HomeEvent {}

class LoadMealsEvent extends HomeEvent {}

class ShowCalendarEvent extends HomeEvent {
  bool showCalendar;

  ShowCalendarEvent({
    required this.showCalendar,
  });
}
