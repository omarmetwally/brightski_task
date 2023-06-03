import 'dart:convert';

import 'package:brightski_task/presentation/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.parse("https://api.npoint.io/43427003d33f1f6b51cc");

    final response = await http.get(uri);

    List<dynamic> data = jsonDecode(response.body);
    List _temp = [];

    return Recipe.recipesFromSnapshot(data);
  }

}