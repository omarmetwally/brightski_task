import 'package:brightski_task/data/datasource/recipes_remote_datasource.dart';
import 'package:brightski_task/presentation/controller/recipes_event.dart';
import 'package:brightski_task/presentation/models/recipe.dart';
import 'package:brightski_task/presentation/models/recipe_api.dart';
import 'package:brightski_task/presentation/wedgits/recipe_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant_menu),
              SizedBox(width: 10),
              Text('Food Recipe')
            ],
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipes.length,
                itemBuilder: (context, index) {
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
              ));
  }
}
