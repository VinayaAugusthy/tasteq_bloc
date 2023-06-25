import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasteq_bloc/application/recipe/recipe_bloc.dart';
import 'package:tasteq_bloc/core/constants/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeBloc, RecipeState>(
      builder: (context, state) {
        final tabItems = state.listRecipe;
        final categories = tabItems
            .map((recipeElement) => recipeElement.category)
            .toSet()
            .toList();
        return DefaultTabController(
          length: categoryItems.length,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Home'),
              centerTitle: true,
            ),
            body: SafeArea(
                child: Container(
              child: Column(
                children: [
                  heightBox10,
                  // TabBar(tabs: categories.map((items) => return ))
                ],
              ),
            )),
          ),
        );
      },
    );
  }
}
