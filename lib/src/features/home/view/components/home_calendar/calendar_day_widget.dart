import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:laverdi/src/shared/extensions/string_extension.dart';

class CalendarDay extends StatelessWidget {
  const CalendarDay({super.key, required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${DateFormat('EEEE', 'pt_BR').format(
                DateTime(
                  date.year,
                  date.month,
                  date.day - 3,
                ),
              ).substring(0, 3).capitalize()}.',
        ),
        const SizedBox(height: 8),
        Text(
          DateTime(date.year, date.month, date.day - 2)
              .day
              .toString()
              .padLeft(2, '0'),
        )
      ],
    );
  }
}
