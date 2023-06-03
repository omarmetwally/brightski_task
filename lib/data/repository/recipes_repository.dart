import 'package:brightski_task/data/datasource/recipes_remote_datasource.dart';
import 'package:brightski_task/domain/entites/recipes.dart';
import 'package:brightski_task/domain/repository/base_recipes_repository.dart';
import 'package:dartz/dartz.dart';



class RecipesRepository extends BaseRecipesRepository{

  final BaseRecipesRemoteDataSource baseRecipesRemoteDataSource;
  RecipesRepository(this.baseRecipesRemoteDataSource);

  @override
  Future<Either< Exception,List<Recipes>>> getRecipes() async {
    final result = await baseRecipesRemoteDataSource.getRecipes();


    return Right(result);


  }

}