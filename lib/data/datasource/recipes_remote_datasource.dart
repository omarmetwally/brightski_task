
import 'package:brightski_task/core/utils/app_constance.dart';
import 'package:brightski_task/data/models/recipes_model.dart';
import 'package:dio/dio.dart';
import 'dart:convert';


abstract class BaseRecipesRemoteDataSource{
  Future<List<RecipesModel>> getRecipes();
}


class RecipesRemoteDataSource extends BaseRecipesRemoteDataSource{
  @override
  Future<List<RecipesModel>> getRecipes() async {
    final response = await Dio().get(AppConstance.recipesEndPoint);

    final responseData = json.decode(response.data);


    if (response.statusCode == 200) {
      return List<RecipesModel>.from((response.data as List).map(
        (e) => RecipesModel.fromJason(e),
      ));
    }else {

      //server error handling (if exists)
      throw Exception("Network error");
    }
  }
}
