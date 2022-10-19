import 'package:flutter/material.dart';
import 'package:laverdi/src/features/recipes/models/recipe.dart';

class RecipesCard extends StatelessWidget {
  RecipesCard({super.key});

  final Recipe recipe = Recipe(
    difficulty: 'Fácil',
    name: 'Panqueca',
    time: 30,
    yield: 1,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        height: 88,
        child: Flex(
          direction: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 30,
              child: ClipRRect(
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(16),
                ),
                child: Image.asset(
                  'assets/images/default_recipe_pic.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const Spacer(flex: 5),
            Expanded(
              flex: 65,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 40,
                    child: Text(
                      recipe.name,
                      style: Theme.of(context).textTheme.titleLarge,
                      softWrap: false,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  const Spacer(flex: 3),
                  Flexible(
                    flex: 19,
                    child: Text(
                      'Tempo de Preparo: ${recipe.time} mins',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                  Flexible(
                    flex: 19,
                    child: Text(
                      'Dificuldade: ${recipe.difficulty}',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                  Flexible(
                    flex: 19,
                    child: Text(
                      'Serve: ${recipe.yield} porção',
                      style: Theme.of(context).textTheme.labelSmall,
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
}
