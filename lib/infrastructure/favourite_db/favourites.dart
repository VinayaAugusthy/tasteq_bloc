import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:tasteq_bloc/domain/recipe_model/recipe.dart';

import '../../favourites/favourites_bloc.dart';

List<Recipe> favList = [];
makeFavourite(String name, Recipe recipe, BuildContext context) {
  final favouriteDB = Hive.box<Recipe>('favourites');
  BlocProvider.of<FavouritesBloc>(context).add(AddToFavourites(name, recipe));
  favouriteDB.put(name, recipe);
  // favList.add(recipe);
  // getFavourite();
}

getFavourite() {
  final favouriteDB = Hive.box<Recipe>('favourites');
  // final favRecipe = favouriteDB.values.toList();
  favList.clear();
  favList.addAll(favouriteDB.values);
}

delFavourite(String name, BuildContext context) {
  final favouriteDB = Hive.box<Recipe>('favourites');
  BlocProvider.of<FavouritesBloc>(context)
      .add(DeleteFavourites(recipeName: name));
  favouriteDB.delete(name);
}
