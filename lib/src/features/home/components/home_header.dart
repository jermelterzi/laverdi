import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:laverdi/src/features/home/bloc/home_bloc.dart';
import 'package:laverdi/src/shared/app_routes.dart';
import 'package:laverdi/src/shared/extensions/string_extension.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16.0,
        left: 16.0,
        right: 16.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Text(
                          DateTime.now().day.toString().padLeft(2, '0'),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        state.showCalendar
                            ? const Text(
                                'HOJE',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                              )
                            : Container(height: 0),
                        Text(
                          DateFormat('EEEE', 'pt_BR')
                              .format(DateTime.now())
                              .capitalize(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 8.0),
                    CircleAvatar(
                      radius: 14,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: IconButton(
                        onPressed: () {
                          context.read<HomeBloc>().add(
                                const ShowCalendarEvent(),
                              );
                        },
                        icon: Icon(
                          state.showCalendar
                              ? FontAwesomeIcons.chevronUp
                              : FontAwesomeIcons.chevronDown,
                          color: Colors.white,
                        ),
                        iconSize: 12,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, AppRoutes.USER_DETAILS),
            child: CircleAvatar(
              radius: 28,
              backgroundImage:
                  const AssetImage('assets/images/laverdi_logo.png'),
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
