import 'package:flutter/material.dart';

class RecipesCard extends StatelessWidget {
  const RecipesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: SizedBox(
          height: 104,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/images/default_recipe_pic.jpg'),
              const SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Nome da Receita'),
                    const SizedBox(height: 16),
                    Text(
                      'Tempo de Preparo: 30 mins',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Text(
                      'Dificuldade: Fácil',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Text(
                      'Serve: 2',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
