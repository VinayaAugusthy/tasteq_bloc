part of 'recipe_bloc.dart';

abstract class RecipeEvent {}

class UploadRecipeEvent extends RecipeEvent {
  final Recipe recipe;

  UploadRecipeEvent({required this.recipe});
}

class DeleteRecipeEvent extends RecipeEvent {
  final int recipeId;

  DeleteRecipeEvent({required this.recipeId});
}

class UpdateRecipeEvent extends RecipeEvent {
  final int updateId;
  final Recipe recipeModal;

  UpdateRecipeEvent({required this.updateId, required this.recipeModal});
}
