import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasteq_bloc/application/recent/recent_bloc.dart';
import 'package:tasteq_bloc/domain/recipe_model/recipe.dart';

List<Recipe> recentsList = [];
final recentBox = Hive.box<Recipe>('recent');
addToRecent(Recipe recipe, BuildContext context) {
  print('object');
  print(recipe.name);

  Recipe recipelist = Recipe(
      image: recipe.image,
      name: recipe.name,
      duration: recipe.duration,
      category: recipe.category,
      ingrediants: recipe.ingrediants,
      procedure: recipe.procedure,
      videoLink: recipe.videoLink);

  int listIndex = 0;

  for (var element in recentBox.values) {
    if (recipelist.name == element.name) {
      BlocProvider.of<RecentBloc>(context).add(AddToRecent(recipe: recipe));
      recentBox.deleteAt(listIndex);
      recentBox.add(recipe);
      break;
    }
    listIndex++;
  }
  BlocProvider.of<RecentBloc>(context).add(AddToRecent(recipe: recipe));
  recentBox.add(recipe);
  // getRecent();
}

recents() {
  List<Recipe> recentlyViewed = recentBox.values.toList();
  recentsList = recentlyViewed.reversed.toList();
}

getRecent() {
  recentsList.clear();
  List<Recipe> recentlyViewed = recentBox.values.toList();
  recentsList.addAll(recentlyViewed.reversed);
  // getRecipeNotifier.value.addAll(list);
  // getRecipeNotifier.notifyListeners();
}
