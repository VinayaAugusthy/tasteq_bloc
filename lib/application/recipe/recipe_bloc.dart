import 'package:bloc/bloc.dart';

import 'package:tasteq_bloc/infrastructure/recipe_db/recipe.dart';

import '../../domain/recipe_model/recipe.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  RecipeBloc() : super(RecipeInitial(listRecipe: recipeList)) {
    on<UploadRecipeEvent>((event, emit) {
      recipeList.add(event.recipe);
      return emit(RecipeState(listRecipe: recipeList));
    });
    on<DeleteRecipeEvent>((event, emit) {
      recipeList.removeAt(event.recipeId);
      return emit(RecipeState(listRecipe: recipeList));
    });
    on<UpdateRecipeEvent>((event, emit) {
      recipeList.removeAt(event.updateId);
      recipeList.insert(event.updateId, event.recipeModal);
    });
  }
}
