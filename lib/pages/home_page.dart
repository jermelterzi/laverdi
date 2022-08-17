import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _buildBody(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          FontAwesomeIcons.plus,
          size: 24,
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 16.0,
          left: 8.0,
          right: 8.0,
        ),
        child: Column(
          children: [
            _buildHeader(),
            _buildCalendar(),
            _buildPlanner(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 32,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 24,
                child: Text(
                  DateTime.now().day.toString().padLeft(2, '0'),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'HOJE',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    DateFormat('EEEE').format(DateTime.now()),
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
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.chevronUp),
                  iconSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCalendar() {
    final DateTime date = DateTime.now();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                  '${DateFormat('EEEE').format(DateTime(date.year, date.month, date.day - 2)).substring(0, 3)}.'),
              const SizedBox(height: 8),
              Text(DateTime(date.year, date.month, date.day - 2)
                  .day
                  .toString()
                  .padLeft(2, '0'))
            ],
          ),
          Column(
            children: [
              Text(
                  '${DateFormat('EEEE').format(DateTime(date.year, date.month, date.day - 1)).substring(0, 3)}.'),
              const SizedBox(height: 8),
              Text(DateTime(date.year, date.month, date.day - 1)
                  .day
                  .toString()
                  .padLeft(2, '0'))
            ],
          ),
          Column(
            children: [
              Text('${DateFormat('EEEE').format(date).substring(0, 3)}.'),
              const SizedBox(height: 8),
              Text(date.day.toString().padLeft(2, '0')),
            ],
          ),
          Column(
            children: [
              Text(
                  '${DateFormat('EEEE').format(DateTime(date.year, date.month, date.day + 1)).substring(0, 3)}.'),
              const SizedBox(height: 8),
              Text(DateTime(date.year, date.month, date.day + 1)
                  .day
                  .toString()
                  .padLeft(2, '0'))
            ],
          ),
          Column(
            children: [
              Text(
                  '${DateFormat('EEEE').format(DateTime(date.year, date.month, date.day + 2)).substring(0, 3)}.'),
              const SizedBox(height: 8),
              Text(DateTime(date.year, date.month, date.day + 2)
                  .day
                  .toString()
                  .padLeft(2, '0'))
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPlanner(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24.0)),
          color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [Text('PLANNER')],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Theme.of(context).colorScheme.primary,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.houseChimney,
                  size: 32,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.cartShopping,
                  size: 32,
                ),
              ),
              const SizedBox(width: 24),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.calendarWeek,
                  size: 32,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.plateWheat,
                  size: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
