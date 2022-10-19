import 'package:flutter/material.dart';
import 'package:laverdi/src/features/home/view/components/home_planner/recipes_card_widget.dart';

class MealWidget extends StatelessWidget {
  const MealWidget({super.key, required this.name, required this.icon});

  final String name;
  final int icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                IconData(icon),
                size: 16,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: SizedBox(
            height: 2 * 96,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, index) => RecipesCard(),
              itemCount: 2,
            ),
          ),
        ),
      ],
    );
  }
}
