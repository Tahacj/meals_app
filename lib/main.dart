import 'package:flutter/material.dart';

import './models/meal.dart';
import 'dummy_data.dart';
import 'screens/Info_screen.dart';
import 'screens/filters_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegaterian": false,
    "vegan": false,
  };
  List<Meal> _avalabileMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterdData) {
    setState(() {
      _filters = filterdData;
      _avalabileMeals = DUMMY_MEALS.where((meal) {
        if (_filters["gluten"]! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters["lactose"]! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters["vegaterian"]! && !meal.isVegetarian) {
          return false;
        }
        if (_filters["vegan"]! && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggoleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DeliMeals",
      theme: ThemeData(
        primarySwatch: Colors.purple,
        hintColor: Colors.amber,
        canvasColor: Color.fromARGB(255, 230, 230, 230),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: TextStyle(
                  fontSize: 20,
                  fontFamily: "RobotoCondensed-Bold",
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(20, 51, 51, 1)),
              titleLarge: TextStyle(
                  fontSize: 24,
                  fontFamily: "Raleway",
                  fontStyle: FontStyle.italic,
                  color: Colors.white),
              bodySmall: TextStyle(
                  fontSize: 22,
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(20, 51, 51, 1)),
            ),
      ),
      routes: {
        "/": (context) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routName: (context) =>
            CategoryMealsScreen(_avalabileMeals),
        MealDetailScreen.routName: (context) =>
            MealDetailScreen(_toggoleFavorite, _isMealFavorite),
        FiltersScreen.routName: (context) =>
            FiltersScreen(_filters, _setFilters),
        InfoScreen.routName: (context) => InfoScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("DeliMeals"),
//       ),
//       body: Center(
//         child: Text("Navigation Time!"),
//       ),
//     );
//   }
// }
