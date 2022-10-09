import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LaVerdiBottomNavigationBar extends StatelessWidget {
  const LaVerdiBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
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
