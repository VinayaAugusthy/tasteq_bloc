import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/list_tile.dart';
import '../../../favourites/favourites_bloc.dart';
import '../../../infrastructure/favourite_db/favourites.dart';

class FavouriteScren extends StatelessWidget {
  const FavouriteScren({super.key});

  @override
  Widget build(BuildContext context) {
    getFavourite();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocBuilder<FavouritesBloc, FavouritesState>(
          builder: (context, state) {
            return state.favRecipe.isNotEmpty
                ? ListView.separated(
                    itemBuilder: (context, index) {
                      final fav = state.favRecipe[index];
                      return callTile(fav, context, index);
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: state.favRecipe.length,
                  )
                : const Center(
                    child: Text(
                      'No Recipies in Favourites',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
