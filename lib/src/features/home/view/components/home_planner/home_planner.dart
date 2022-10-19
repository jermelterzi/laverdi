import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laverdi/src/features/home/view/bloc/home_bloc.dart';
import 'package:laverdi/src/features/home/view/components/home_planner/meal_widget.dart';

class HomePlanner extends StatelessWidget {
  const HomePlanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
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
              child: BlocConsumer<HomeBloc, HomeState>(
                listener: (context, state) {
                  if (state.status == HomeStatus.error) {
                    _showErrorSnackBar(
                      state.errorMessage,
                      context,
                    );
                  }
                },
                builder: (context, state) {
                  if (state.status == HomeStatus.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final meals = state.meals;
                  return ListView.builder(
                    itemBuilder: (ctx, index) => MealWidget(
                      name: meals[index].name,
                      icon: meals[index].icon,
                    ),
                    itemCount: meals.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showErrorSnackBar(
    String? errorMessage,
    BuildContext context,
  ) {
    final errorSnackBar = SnackBar(
      content: Text(
        errorMessage ?? 'Ocorreu um erro, tente novamente mais tarde!',
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
  }
}
