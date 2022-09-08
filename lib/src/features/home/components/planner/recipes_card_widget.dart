import 'package:flutter/material.dart';

class RecipesCard extends StatelessWidget {
  const RecipesCard({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/images/default_recipe_pic.jpg'),
            Expanded(
              child: Column(
                children: [
                  const Text('Nome da Receita'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Tempo de Preparo: 30 mins'),
                      Text('Dificuldade: Fácil'),
                      Text('Serve: 2'),
                    ],
                  ),
                  const Text('Ingredientes'),
                ],
              ),
            ),
          ],
        ));
  }
}
