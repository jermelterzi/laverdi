import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laverdi/src/features/home/view/bloc/home_bloc.dart';
import 'package:laverdi/src/features/home/view/components/home_calendar/home_calendar.dart';
import 'package:laverdi/src/features/home/view/components/home_header.dart';
import 'package:laverdi/src/features/home/view/components/home_planner/home_planner.dart';
import 'package:laverdi/src/shared/components/laverdi_bottom_navigation_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          FontAwesomeIcons.plus,
        ),
      ),
      bottomNavigationBar: const LaVerdiBottomNavigationBar(),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/laverdi_background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
              left: 8.0,
              right: 8.0,
            ),
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return Column(
                  children: [
                    const HomeHeader(),
                    AnimatedCrossFade(
                      firstChild: Container(),
                      secondChild: const HomeCalendar(),
                      crossFadeState: state.showCalendar
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration: const Duration(milliseconds: 600),
                    ),
                    const HomePlanner(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
