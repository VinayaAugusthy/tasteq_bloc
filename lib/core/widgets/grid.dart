// import 'dart:io';

// import 'package:flutter/material.dart';

// import '../../domain/recipe_model/recipe.dart';

// callGrid(List<Recipe> recipe, String category) {
//   return CustomScrollView(
//     slivers: [
//       SliverPadding(
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
//         sliver: SliverGrid(
//           delegate: SliverChildBuilderDelegate(
//             (context, index) {
//               final datacategory = recipe[index];
//               // print("hey in valulisnable");
//               // final selectedRecipe = datacategory.name;
//               // final isFavourited = favBox.containsKey(selectedRecipe);
//               // print('list:${state.sortedList.length}');
//               return Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   boxShadow: const [
//                     BoxShadow(
//                       color: Color.fromARGB(255, 185, 185, 255),
//                       offset: Offset(1, 1),
//                       blurRadius: 5,
//                     ),
//                   ],
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Column(
//                   key: ValueKey(datacategory.id),
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: IconButton(
//                             onPressed: () {
//                               // if (isFavourited) {
//                               //   delFavourite(selectedRecipe, context);
//                               // } else {
//                               //   makeFavourite(
//                               //       selectedRecipe, datacategory, context);
//                               // }
//                             },
//                             icon: const Icon(
//                               // isFavourited
//                               //     ? Icons.favorite
//                               Icons.favorite_outline_outlined,
//                               color: Colors.red,
//                               size: 40,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         // Navigator.of(context).push(MaterialPageRoute(
//                         //   builder: (ctx) => ViewRecipes(
//                         //       passValue: datacategory, passId: index),
//                         // ));
//                       },
//                       child: Container(
//                         height: 120,
//                         width: 120,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: FileImage(File(datacategory.image)),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Text(
//                       datacategory.name,
//                       style: const TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//             childCount: recipe.length,
//           ),
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             mainAxisExtent: 270,
//             crossAxisSpacing: 15,
//             mainAxisSpacing: 15,
//           ),
//         ),
//       ),
//     ],
//   );
// }
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasteq_bloc/application/recipe/recipe_bloc.dart';

import '../../domain/recipe_model/recipe.dart';
import '../../favourites/favourites_bloc.dart';
import '../../infrastructure/favourite_db/favourites.dart';
import '../../presentation/screens/view_recipies/view_recipes.dart';

Widget callGrid(List<Recipe> recipes, String category, BuildContext context) {
  // Box<Recipe> favBox = Hive.box<Recipe>('favourites');
  return BlocBuilder<RecipeBloc, RecipeState>(
    builder: (context, state) {
      final filteredRecipes =
          recipes.where((recipe) => recipe.category == category).toList();
      return SizedBox(
        height: 200,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final dataCategory = filteredRecipes[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 185, 185, 255),
                            offset: Offset(1, 1),
                            blurRadius: 5,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        key: ValueKey(dataCategory.id),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: BlocBuilder<FavouritesBloc,
                                    FavouritesState>(
                                  builder: (context, state) {
                                    bool isFavourited =
                                        favList.contains(dataCategory);
                                    return IconButton(
                                      onPressed: () {
                                        if (isFavourited) {
                                          delFavourite(
                                              dataCategory.name, context);
                                        } else {
                                          makeFavourite(dataCategory.name,
                                              dataCategory, context);
                                        }
                                      },
                                      icon: Icon(
                                        isFavourited
                                            ? Icons.favorite
                                            : Icons.favorite_outline_outlined,
                                        color: Colors.red,
                                        size: 40,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => ViewRecipes(
                                    passValue: dataCategory, passId: index),
                              ));
                            },
                            child: Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: FileImage(File(dataCategory.image)),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            dataCategory.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: filteredRecipes.length,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 270,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
