import 'dart:convert';

import 'package:brightski_task/presentation/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function toggleFavorite;
  final Function isFavorite;
  late List<Recipe> _recipes;

  MealDetailScreen(this.toggleFavorite, this.isFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  Future<void> _getShared(Map<dynamic, dynamic> val) async {
    List<Recipe> MyFav = [];

    final userData = jsonEncode(
      {
        "id": val["id"],
        "name": val["title"],
        "time": val["cookTime"],
        "rating": (val["rating"]) != null ? val["rating"].rating : 0,
        "image": val["thumbnailUrl"],
        "description": val["description"],
        "ingredients": val["ingredients"],
      },
    );


    // MyFav.add(myRecipe);
    // MyFav.add(myRecipe);



    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    if (prefs.containsKey('recipes')) {

      final extractedUserData2 = prefs.getString('recipes')!;
      final extractedUserData7 = json.decode(extractedUserData2) as Map<String, dynamic>;

      final myRecipe = Recipe.fromJson(extractedUserData7);
      MyFav.add(myRecipe);






    }

    final extractedUserData = json.decode(userData) as Map<String, dynamic>;

    final myRecipe = Recipe.fromJson(extractedUserData);
  //  prefs.setString('recipes', userData);



    MyFav.add(myRecipe);



   prefs.setString('recipes', MyFav.toString());

//     final prefs = await SharedPreferences.getInstance();
//    //prefs.clear();
//
//     int num=(prefs.getInt("no_Fav") != null
//         ? (prefs.getInt("no_Fav")!)
//         : 0);
// num++;
    /*Map<dynamic, dynamic>? oldVal = (prefs.getString("recipes") != null
        ? Map<dynamic, dynamic>.from(json.decode(prefs.getString("recipes")!))
        : null);
    if (oldVal != null) {
      oldVal.addAll(val);
      prefs.setString(
          "recipes",
          json.encode({
            "id": oldVal["id"],
            "title": oldVal["title"],
            "cookTime": oldVal["cookTime"],
            "rating": (oldVal["rating"]) != null ? oldVal["rating"] : 0,
            "thumbnailUrl": oldVal["thumbnailUrl"],
            "description": oldVal["description"],
            "ingredients": oldVal["ingredients"],
          }));
    } else {
      prefs.setString(
          "recipes",
          json.encode({
            "id": val["id"],
            "title": val["title"],
            "cookTime": val["cookTime"],
            "rating": (val["rating"]) != null ? val["rating"] : 0,
            "thumbnailUrl": val["thumbnailUrl"],
            "description": val["description"],
            "ingredients": val["ingredients"],
          }));
    }
*/
    /*  final userData = json.encode(
      {
        "id":val["id"],
        "title":val["title"],
        "cookTime":val["cookTime"],
        "rating": (val["rating"]) != null?val["rating"].rating:0,
        "thumbnailUrl": val["thumbnailUrl"],
        "description": val["description"] ,
        "ingredients": val["ingredients"] ,
      },
    );
    prefs.setInt('no_Fav', num);
    prefs.setString('recipes$num', userData);*/
  }

  @override
  Widget build(BuildContext context) {
    // final selectedMeal = ModalRoute.of(context)!.settings.arguments as String;

    final selectedMeal =
        (ModalRoute.of(context)?.settings.arguments ?? <dynamic>{}) as Map;
    print(selectedMeal);
    return Scaffold(
        appBar: AppBar(
          title: Text('${selectedMeal['title']}'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal["thumbnailUrl"],
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle(context, 'Description'),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Text(
                  selectedMeal["description"],
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              buildSectionTitle(context, 'Ingredients'),
              buildContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(selectedMeal["ingredients"][index])),
                  ),
                  itemCount: selectedMeal["ingredients"].length,
                ),
              ),
              buildSectionTitle(context, 'Steps'),
              buildContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${(index + 1)}'),
                        ),
                        title: Text(
                          selectedMeal["ingredients"][index],
                        ),
                      ),
                      Divider()
                    ],
                  ),
                  itemCount: selectedMeal["ingredients"].length,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.star_border
              //isFavorite(selectedMeal["id"]) ? Icons.star : Icons.star_border,
              ),
          onPressed: () async => {
            //toggleFavorite(selectedMeal["id"])
            Icon(Icons.star
            ),

            _getShared(selectedMeal),
          },
        ));
  }
}
