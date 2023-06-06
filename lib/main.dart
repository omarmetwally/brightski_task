import 'dart:convert';

import 'package:brightski_task/presentation/models/recipe.dart';
import 'package:brightski_task/presentation/screens/auth_screen.dart';
import 'package:brightski_task/presentation/screens/recipe_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/services/services_locator.dart';
import 'presentation/screens/tabs_screen.dart';

void main()  {
  ServicesLocator().init();


  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Recipe> _favoriteMeals = [];

  void _toggleFavorite(String mealId) {
    final existingIndex =
    _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          _favoriteMeals.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  Future<void> _getShared() async {
    final prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey('no_Fav')) {
      return ;
    }
    int num = prefs.getInt("no_Fav")!;


    for (int i = 0; i < num; i++) {
      final extractedData = json.decode(prefs.getString('recipes$num')!)  ;
      _favoriteMeals.add(extractedData["id"] );

      print(_favoriteMeals);

    }
    /*final userData = json.encode(
      {
        "id": val["id"],
        "title": val["title"],
        "cookTime": val["cookTime"],
        "rating": (val["rating"]) != null ? val["rating"].rating : 0,
        "thumbnailUrl": val["thumbnailUrl"],
        "description": val["description"],
        "ingredients": val["ingredients"],
      },
    );
    prefs.setInt('no_Fav', num);
    prefs.setString('recipes$num', userData);*/
  }

  @override
  void initState() {
    print("INMAINNNNN");
    _MyAppState()._getShared();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food recipe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.cyan,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.red, // Your accent color
        ),
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) =>AuthScreen(),//(context) => TabsScreen(_favoriteMeals),
        TabsScreen.routeName: (context) =>
            TabsScreen(_favoriteMeals),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_toggleFavorite, _isMealFavorite),
      },
    );
  }
}
