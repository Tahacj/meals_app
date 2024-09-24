import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';

import '../widget/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routName = "/category-meals";

  final List<Meal> avalableMeals;

  CategoryMealsScreen(this.avalableMeals);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final categoryId = routeArgs["Id"];
    final categoryTitle = routeArgs["title"];
    final categoryMeals = avalableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        }),
        itemCount: categoryMeals.length,
      ),
    );
  }
}
