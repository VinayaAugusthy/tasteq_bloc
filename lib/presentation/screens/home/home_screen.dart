import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasteq_bloc/application/recipe/recipe_bloc.dart';
import 'package:tasteq_bloc/core/constants/constants.dart';
import 'package:tasteq_bloc/core/widgets/grid.dart';

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
        final List<String> categories = tabItems
            .map((recipeElement) => recipeElement.category)
            .toSet()
            .toList();
        return DefaultTabController(
          length: categories.length,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Home'),
              centerTitle: true,
            ),
            body: Column(
              children: [
                heightBox10,
                TabBar(
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.redAccent),
                  tabs: categories
                      .map((items) => Tab(
                            child: Text(items),
                          ))
                      .toList(),
                ),
                Expanded(
                  child: TabBarView(
                    children: categories
                        .map(
                            (category) => callGrid(tabItems, category, context))
                        .toList(),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
