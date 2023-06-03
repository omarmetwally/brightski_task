import 'package:brightski_task/domain/entites/recipes.dart';
import 'package:brightski_task/domain/repository/base_recipes_repository.dart';
import 'package:dartz/dartz.dart';

class GetRecipesUseCase{
  final BaseRecipesRepository baseRecipesRepository;
  GetRecipesUseCase(this.baseRecipesRepository);


 Future<Either<Exception,List<Recipes>>> excute () async
  {
    return await baseRecipesRepository.getRecipes();
  }



}