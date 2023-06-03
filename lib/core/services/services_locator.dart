import 'package:brightski_task/data/datasource/recipes_remote_datasource.dart';
import 'package:brightski_task/data/repository/recipes_repository.dart';
import 'package:brightski_task/domain/repository/base_recipes_repository.dart';
import 'package:brightski_task/domain/usecases/get_recipes_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    
    ///USe CAses
    sl.registerLazySingleton(() => GetRecipesUseCase(sl()));
    
    ///Repository
    sl.registerLazySingleton<BaseRecipesRepository>(() => RecipesRepository(sl()));
    
    
    ///DATA SOURCE
    sl.registerLazySingleton<BaseRecipesRemoteDataSource>(
        () => RecipesRemoteDataSource());
  }
}
