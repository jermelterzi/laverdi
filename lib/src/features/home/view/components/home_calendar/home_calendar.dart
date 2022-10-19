import 'package:flutter/material.dart';
import 'package:laverdi/src/features/home/view/components/home_calendar/calendar_day_widget.dart';

class HomeCalendar extends StatelessWidget {
  const HomeCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CalendarDay(date: date.subtract(const Duration(days: 3))),
          CalendarDay(date: date.subtract(const Duration(days: 2))),
          CalendarDay(date: date.subtract(const Duration(days: 1))),
          CalendarDay(date: date),
          CalendarDay(date: date.add(const Duration(days: 1))),
          CalendarDay(date: date.add(const Duration(days: 2))),
          CalendarDay(date: date.add(const Duration(days: 3))),
        ],
      ),
    );
  }
}
