// ignore_for_file: list_remove_unrelated_type, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasteq_bloc/infrastructure/favourite_db/favourites.dart';
import '../../domain/recipe_model/recipe.dart';
part 'favourites_event.dart';
part 'favourites_state.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  FavouritesBloc() : super(FavouritesInitial(favRecipe: favList)) {
    on<AddToFavourites>((event, emit) {
      favList.add(event.favourite);
      return emit(FavouritesState(favRecipe: favList));
    });
    on<DeleteFavourites>((event, emit) {
      favList.remove(event.recipeName);
      return emit(FavouritesState(favRecipe: favList));
    });
  }
}
