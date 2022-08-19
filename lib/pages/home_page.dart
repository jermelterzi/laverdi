import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:laverdi/utils/extensions/string_extension.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showCalendar = false;

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
              _buildHeader(),
              _showCalendar ? _buildCalendar() : Container(height: 0),
              _buildPlanner(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16.0,
        left: 16.0,
        right: 16.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
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
                    _showCalendar
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
                      setState(() {
                        _showCalendar = !_showCalendar;
                      });
                    },
                    icon: Icon(
                      _showCalendar
                          ? FontAwesomeIcons.chevronUp
                          : FontAwesomeIcons.chevronDown,
                      color: Colors.white,
                    ),
                    iconSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const CircleAvatar(
            radius: 28,
          ),
        ],
      ),
    );
  }

  Widget _buildCalendar() {
    final DateTime date = DateTime.now();

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                  '${DateFormat('EEEE', 'pt_BR').format(DateTime(date.year, date.month, date.day - 3)).substring(0, 3).capitalize()}.'),
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
                  '${DateFormat('EEEE', 'pt_BR').format(DateTime(date.year, date.month, date.day - 2)).substring(0, 3).capitalize()}.'),
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
                  '${DateFormat('EEEE', 'pt_BR').format(DateTime(date.year, date.month, date.day - 1)).substring(0, 3).capitalize()}.'),
              const SizedBox(height: 8),
              Text(DateTime(date.year, date.month, date.day - 1)
                  .day
                  .toString()
                  .padLeft(2, '0'))
            ],
          ),
          Column(
            children: [
              Text(
                  '${DateFormat('EEEE', 'pt_BR').format(date).substring(0, 3).capitalize()}.'),
              const SizedBox(height: 8),
              Text(date.day.toString().padLeft(2, '0')),
            ],
          ),
          Column(
            children: [
              Text(
                  '${DateFormat('EEEE', 'pt_BR').format(DateTime(date.year, date.month, date.day + 1)).substring(0, 3).capitalize()}.'),
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
                  '${DateFormat('EEEE', 'pt_BR').format(DateTime(date.year, date.month, date.day + 2)).substring(0, 3).capitalize()}.'),
              const SizedBox(height: 8),
              Text(DateTime(date.year, date.month, date.day + 2)
                  .day
                  .toString()
                  .padLeft(2, '0'))
            ],
          ),
          Column(
            children: [
              Text(
                  '${DateFormat('EEEE', 'pt_BR').format(DateTime(date.year, date.month, date.day + 3)).substring(0, 3).capitalize()}.'),
              const SizedBox(height: 8),
              Text(DateTime(date.year, date.month, date.day - 2)
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
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24.0)),
          color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
        ),
        child: Column(
          children: [
            Text(
              'PLANNER',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          FontAwesomeIcons.cloudSun,
                          size: 16,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          'CAFÉ DA MANHÃ',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Flexible(
                    flex: 3,
                    child: ListView.builder(
                      itemBuilder: (ctx, index) => const Card(
                        color: Colors.white,
                        child: SizedBox(
                          height: 80,
                          child: Center(
                            child: Text('Card Exemplo de Café da Manhã'),
                          ),
                        ),
                      ),
                      itemCount: 1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          FontAwesomeIcons.solidSun,
                          size: 16,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          'ALMOÇO',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Flexible(
                    flex: 3,
                    child: ListView.builder(
                      itemBuilder: (ctx, index) => const Card(
                        color: Colors.white,
                        child: SizedBox(
                          height: 80,
                          child: Center(
                            child: Text('Card Exemplo de Almoço'),
                          ),
                        ),
                      ),
                      itemCount: 1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          FontAwesomeIcons.solidMoon,
                          size: 16,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          'JANTAR',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Flexible(
                    flex: 3,
                    child: ListView.builder(
                      itemBuilder: (ctx, index) => const Card(
                        color: Colors.white,
                        child: SizedBox(
                          height: 80,
                          child: Center(
                            child: Text('Card Exemplo de Jantar'),
                          ),
                        ),
                      ),
                      itemCount: 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Colors.white,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
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
                  FontAwesomeIcons.utensils,
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
