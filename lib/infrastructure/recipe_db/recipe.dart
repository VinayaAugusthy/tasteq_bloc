import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:tasteq_bloc/domain/recipe_model/recipe.dart';

import '../../application/recipe/recipe_bloc.dart';

List<Recipe> recipeList = [];
getRecipes() {
  final recipeDB = Hive.box<Recipe>('addRecipe');
  recipeList.clear();
  recipeList.addAll(recipeDB.values);
}

upload(Recipe value, BuildContext context) {
  final recipebox = Hive.box<Recipe>('addRecipe');
  BlocProvider.of<RecipeBloc>(context).add(UploadRecipeEvent(recipe: value));
  recipebox.add(value);
  getRecipes();
}

deleteRecipe(int id, BuildContext context) {
  final recipeDB = Hive.box<Recipe>('addrecipe');
  BlocProvider.of<RecipeBloc>(context).add(DeleteRecipeEvent(recipeId: id));
  recipeDB.deleteAt(id);
  getRecipes();
}
