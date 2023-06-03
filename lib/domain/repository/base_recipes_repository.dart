import 'package:brightski_task/domain/entites/recipes.dart';
import 'package:dartz/dartz.dart';

abstract class BaseRecipesRepository
{



   Future<Either<Exception ,List <Recipes>>> getRecipes();
}