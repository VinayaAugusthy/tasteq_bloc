import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasteq_bloc/domain/recipe_model/recipe.dart';
import 'package:tasteq_bloc/infrastructure/recent_db/recent_db.dart';
import '../../../application/recent/recent_bloc.dart';
import '../view_recipies/view_recipes.dart';

class Recent extends StatelessWidget {
  const Recent({super.key});

  @override
  Widget build(BuildContext context) {
    // getRecent();
    List<Recipe> recent = recentsList.toSet().toList();
    return BlocBuilder<RecentBloc, RecentState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Recently Viewed'),
            centerTitle: true,
          ),
          body: SafeArea(
            child: recent.isNotEmpty
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      final data = recent[index];
                      return ListTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) =>
                                  ViewRecipes(passValue: data, passId: index)));
                        },
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundImage: FileImage(File(data.image)),
                        ),
                        title: Text(
                          data.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                    itemCount: recent.length,
                  )
                : const Center(
                    child: Text(
                      'No recipes in recntly viewed',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
