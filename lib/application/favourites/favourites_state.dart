part of 'favourites_bloc.dart';

@immutable
class FavouritesState {
  final List<Recipe> favRecipe;

  FavouritesState({required this.favRecipe});
}

class FavouritesInitial extends FavouritesState {
  FavouritesInitial({required super.favRecipe});
}
