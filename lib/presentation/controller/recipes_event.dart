import 'package:equatable/equatable.dart';

abstract class RecipesEvent extends Equatable{
  RecipesEvent();

  @override
  List<Object> get props =>[];
}

class getRecipes extends RecipesEvent {}