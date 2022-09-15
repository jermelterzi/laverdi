import 'package:flutter/material.dart';
import 'package:laverdi/src/features/home/bloc/home_events.dart';
import 'package:laverdi/src/features/home/bloc/home_state.dart';
import 'package:provider/provider.dart';

import '../../bloc/home_bloc.dart';
import '../../models/meal.dart';
import 'meal_widget.dart';

class HomePlanner extends StatefulWidget {
  const HomePlanner({super.key});

  @override
  State<HomePlanner> createState() => _HomePlannerState();
}

class _HomePlannerState extends State<HomePlanner> {
  late final HomeBloc homeBloc;

  @override
  void initState() {
    homeBloc = Provider.of<HomeBloc>(
      context,
      listen: false,
    );
    homeBloc.inputEvent.add(LoadMealsEvent());
    super.initState();
  }

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
              child: StreamBuilder<HomeState>(
                stream: homeBloc.stream,
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    List<Meal> mealsList = snapshot.data?.meals ?? [];
                    return ListView.builder(
                      itemBuilder: (ctx, index) => MealWidget(
                        name: mealsList[index].name,
                        icon: mealsList[index].icon,
                      ),
                      itemCount: mealsList.length,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
