import 'package:flutter/material.dart';
import 'package:laverdi/src/features/home/data/meals_list.dart';

import 'meal_widget.dart';

class HomePlanner extends StatelessWidget {
  const HomePlanner({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: ListView.builder(
                itemBuilder: (ctx, index) => MealWidget(
                  name: mealsList[index].name,
                  icon: mealsList[index].icon,
                ),
                itemCount: mealsList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
