import 'package:brightski_task/core/utils/enums.dart';
import 'package:brightski_task/domain/entites/recipes.dart';
import 'package:equatable/equatable.dart';

class RecipesState extends Equatable {
  final List<Recipes> recipes;
  final RequestState recipesState;
  final String message;

  const RecipesState({
    this.recipes = const [],
    this.recipesState = RequestState.loading,
    this.message = '',
  });

  @override
  List<Object?> get props => [
        recipes,
        recipesState,
        message,
      ];
}
