import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasteq_bloc/application/recent/recent_bloc.dart';
import 'package:tasteq_bloc/domain/recipe_model/recipe.dart';

List<Recipe> recentsList = [];
addToRecent(Recipe recipe, BuildContext context) {
  print('object');
  print(recipe.name);
  final recentBox = Hive.box<Recipe>('recent');
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
      BlocProvider.of<RecentBloc>(context).add(addToRecent(recipe, context));
      recentBox.deleteAt(listIndex);
      recentBox.add(recipe);
      break;
    }
    listIndex++;
  }
  BlocProvider.of<RecentBloc>(context).add(addToRecent(recipe, context));
  recentBox.add(recipe);
  getRecent();
}

getRecent() async {
  final recentBox = Hive.box<Recipe>('recent');
  final list = recentBox.values.toList();
  recentsList = list.reversed.toList();
  // getRecipeNotifier.value.addAll(list);
  // getRecipeNotifier.notifyListeners();
}
