import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tasteq_bloc/domain/recipe_model/recipe.dart';

List<Recipe> recipeList = [];
getRecipes() {
  final recipeDB = Hive.box<Recipe>('addRecipe');
  recipeList.clear();
  recipeList.addAll(recipeDB.values);
}

upload(Recipe value, BuildContext context) {
  final recipebox = Hive.box<Recipe>('addRecipe');
  // Blocprovider.of<RecipeBloc>(context).add(UploadRecipeEvent(recipe: value));
  recipebox.add(value);
  getRecipes();
}
