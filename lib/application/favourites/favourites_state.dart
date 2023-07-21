part of 'favourites_bloc.dart';

@immutable
class FavouritesState {
  final List<Recipe> favRecipe;

  const FavouritesState({required this.favRecipe});
}

class FavouritesInitial extends FavouritesState {
  const FavouritesInitial({required super.favRecipe});
}
