import 'package:brightski_task/domain/entites/recipes.dart';

class RecipesModel extends Recipes {
  const RecipesModel(
    String id,
    String name,
    String image,
    String time,
    String description,
    List<String> ingredients,
  ) : super(
         id: id,
          name:name,
          image:image,
          time:time,
    description:description,
    ingredients:ingredients,
        );

  factory RecipesModel.fromJason(Map<String, dynamic> json) => RecipesModel(
        json["id"],
        json["name"],
        json["image"],
        json["time"],
        json["description"],
        List<String>.from(json["ingredients"].map((e) => e)),
      );
}
