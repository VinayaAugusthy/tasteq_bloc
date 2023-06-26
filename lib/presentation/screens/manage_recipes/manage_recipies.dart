import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasteq_bloc/application/recipe/recipe_bloc.dart';
import 'package:tasteq_bloc/presentation/screens/manage_recipes/update_recipe.dart';
import '../../../infrastructure/recipe_db/recipe.dart';
import '../view_recipies/view_recipes.dart';

class ManageRecipes extends StatelessWidget {
  const ManageRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeBloc, RecipeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Recipes'),
            centerTitle: true,
          ),
          body: SafeArea(
            child: ListView.separated(
              itemBuilder: (ctx, index) {
                // getRecipes();
                final data = state.listRecipe[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    // backgroundColor: Colors.green,
                    backgroundImage: FileImage(File(data.image)),
                  ),
                  title: Text(data.name),
                  trailing: Wrap(
                    spacing: 12,
                    children: <Widget>[
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => UpdateRecipe(index: index),
                              ),
                            );
                          },
                          icon: const Icon(Icons.edit),
                          color: Colors.blue),
                      IconButton(
                        onPressed: () {
                          deleteAlert(context, index);
                        },
                        icon: const Icon(Icons.delete),
                        color: Colors.red,
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => ViewRecipes(
                          passId: index,
                          passValue: data,
                        ),
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: state.listRecipe.length,
            ),
          ),
        );
      },
    );
  }

  deleteAlert(BuildContext context, key) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        content: const Text('Delete data Permanently?'),
        actions: [
          TextButton(
              onPressed: () {
                deleteRecipe(key, context);
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
  }
}
