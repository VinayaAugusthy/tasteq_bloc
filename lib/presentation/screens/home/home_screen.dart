import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasteq_bloc/application/recipe/recipe_bloc.dart';
import 'package:tasteq_bloc/core/constants/constants.dart';
import 'package:tasteq_bloc/core/widgets/grid.dart';
import 'package:tasteq_bloc/domain/authentication_model/authentication.dart';
import 'package:tasteq_bloc/infrastructure/recipe_db/recipe.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Hive.openBox<Authentication>('authentication');
    getRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeBloc, RecipeState>(
      builder: (context, state) {
        final tabItems = recipeList.toList();
        final categories = tabItems
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
            body: SafeArea(
              child: Column(
                children: [
                  heightBox10,
                  TabBar(
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Colors.redAccent),
                    unselectedLabelColor: Colors.black,
                    tabs: categories
                        .map((items) => Tab(
                              child: Text(items),
                            ))
                        .toList(),
                  ),
                  Expanded(
                    child: recipeList.isNotEmpty
                        ? TabBarView(
                            children: categories
                                .map((category) =>
                                    callGrid(tabItems, category, context))
                                .toList(),
                          )
                        : const Center(
                            child: Text(
                              'Please add recipies',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
