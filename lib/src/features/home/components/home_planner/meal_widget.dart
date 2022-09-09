import 'package:flutter/material.dart';
import 'package:laverdi/src/features/home/components/home_planner/recipes_card_widget.dart';

class MealWidget extends StatelessWidget {
  const MealWidget({Key? key, required this.name, required this.icon})
      : super(key: key);

  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 16,
                color: Colors.white,
              ),
              const SizedBox(width: 8.0),
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 128,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (ctx, index) => const RecipesCard(),
            itemCount: 1,
          ),
        ),
      ],
    );
  }
}
