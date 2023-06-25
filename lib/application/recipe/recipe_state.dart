part of 'recipe_bloc.dart';

@immutable
class RecipeState {
  final List<Recipe> listRecipe;

  RecipeState({required this.listRecipe});
}

class RecipeInitial extends RecipeState {
  RecipeInitial({required super.listRecipe});
}
