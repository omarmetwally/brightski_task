import 'package:brightski_task/core/services/services_locator.dart';

import 'package:brightski_task/presentation/controller/recipes_bloc.dart';
import 'package:brightski_task/presentation/controller/recipes_event.dart';
import 'package:brightski_task/presentation/controller/recipes_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {

  @override
  Widget build(BuildContext context) {
   // print(sl<GetRecipesUseCase>().hashCode);
    return BlocProvider(
      create: (BuildContext context) {
        return RecipesBloc(sl())..add(getRecipes());
      },

//(BuildContext context)=>sl<RecipesBloc>()..add((getRecipes())),
      child:BlocBuilder <RecipesBloc,RecipesState>(
        builder:(context,state) {
          print(state.recipes.length);


          return Scaffold();

        },),
      );
  }

  @override
  void initState() {
    super.initState();
  }
}
