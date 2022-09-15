import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laverdi/src/features/home/components/home_calendar/home_calendar.dart';
import 'package:laverdi/src/features/home/components/home_header.dart';
import 'package:laverdi/src/features/home/components/home_planner/home_planner.dart';
import 'package:laverdi/src/shared/components/bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bool _showCalendar = false;

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
            child: Column(
              children: [
                const HomeHeader(),
                _showCalendar ? const HomeCalendar() : Container(),
                const HomePlanner(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
