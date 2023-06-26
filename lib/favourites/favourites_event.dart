part of 'favourites_bloc.dart';

@immutable
abstract class FavouritesEvent {}

class AddToFavourites extends FavouritesEvent {
  final String value;
  final Recipe favourite;

  AddToFavourites(this.value, this.favourite);
}

class DeleteFavourites extends FavouritesEvent {
  final String recipeName;

  DeleteFavourites({required this.recipeName});
}
