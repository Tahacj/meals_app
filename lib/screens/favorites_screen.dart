import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widget/meal_item.dart';

class FavoriteMealSceen extends StatelessWidget {
  static const routName = "/favorite-meals";

  final List<Meal> userFavoriteMeals;

  FavoriteMealSceen(this.userFavoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (userFavoriteMeals.isEmpty) {
      return Scaffold(
        body: Center(
            child: Text(
                "You have no favorites yet \n \n      satrt adding some!")),
      );
    } else {
      return ListView.builder(
        itemBuilder: ((context, index) {
          return MealItem(
            id: userFavoriteMeals[index].id,
            title: userFavoriteMeals[index].title,
            imageUrl: userFavoriteMeals[index].imageUrl,
            duration: userFavoriteMeals[index].duration,
            complexity: userFavoriteMeals[index].complexity,
            affordability: userFavoriteMeals[index].affordability,
          );
        }),
        itemCount: userFavoriteMeals.length,
      );
    }
  }
}
