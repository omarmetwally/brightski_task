
import 'package:brightski_task/core/utils/enums.dart';
import 'package:brightski_task/domain/entites/recipes.dart';
import 'package:brightski_task/domain/usecases/get_recipes_usecase.dart';
import 'package:brightski_task/presentation/controller/recipes_event.dart';
import 'package:brightski_task/presentation/controller/recipes_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipesBloc extends Bloc<RecipesEvent,RecipesState>{
  final GetRecipesUseCase getRecipesUseCase;
  RecipesBloc(this.getRecipesUseCase):super(const RecipesState()){

   on<getRecipes>((event, emit) async{

   final result =await getRecipesUseCase.excute();
     //print (result);

  result.fold(
         (l) => null,
         (r) => emit(  RecipesState(recipes: r),
   ),);
    /// result.fold(initialValue, (previousValue, element) => null)
     ///emit(const RecipesState(recipes: result));



   });
  }

}