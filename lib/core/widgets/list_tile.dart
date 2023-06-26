import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tasteq_bloc/domain/recipe_model/recipe.dart';
import '../../infrastructure/favourite_db/favourites.dart';
import '../../presentation/screens/view_recipies/view_recipes.dart';

Widget callTile(Recipe recipe, BuildContext context, int index) {
  return ListTile(
    leading: CircleAvatar(
      radius: 25,
      backgroundImage: FileImage(File(recipe.image)),
    ),
    title: Text(recipe.name),
    subtitle: Text(recipe.category),
    trailing: IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            content: const Text('Delete data Permanently?'),
            actions: [
              TextButton(
                  onPressed: () {
                    delFavourite(recipe.name, context);
                    getFavourite();
                    Navigator.of(context).pop(ctx);
                  },
                  child: const Text(
                    'Delete',
                    style: TextStyle(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(ctx);
                  },
                  child: const Text('Cancel'))
            ],
          ),
        );
      },
      icon: const Icon(Icons.remove_circle_outline_rounded),
      color: Colors.red,
    ),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ViewRecipes(passValue: recipe, passId: index),
        ),
      );
    },
  );
}
