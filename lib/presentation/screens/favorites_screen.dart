import 'dart:convert';

import 'package:brightski_task/presentation/models/recipe.dart';
import 'package:brightski_task/presentation/models/recipe_api.dart';
import 'package:brightski_task/presentation/wedgits/recipe_card.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class FavoritesScreen extends StatelessWidget {
  final List<Recipe> favoriteMeals;
  late List<Recipe> _recipes;

  FavoritesScreen(this.favoriteMeals);
  Future<bool> getDataShared() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('recipes')) {
      return false;
    }
    final extractedUserData = json.decode(prefs.getString('recipes')!) as Map<dynamic, dynamic>;

    return true;
  }
  @override
  Widget build(BuildContext context) {
    if (!favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
     }
    else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return RecipeCard(
            id:_recipes[index].id!,
            title: _recipes[index].name!,
            cookTime: _recipes[index].time,
            rating: (_recipes[index].rating) != null?_recipes[index].rating:0,
            thumbnailUrl: _recipes[index].image,
            description: _recipes[index].description ,
            ingredients: _recipes[index].ingredients ,
          );
        },
        itemCount: 1,
      );
    }
   }
}
