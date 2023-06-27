import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tasteq_bloc/application/recipe/recipe_bloc.dart';
import 'package:tasteq_bloc/domain/recipe_model/recipe.dart';
import 'package:tasteq_bloc/presentation/base_screen.dart';
import 'application/favourites/favourites_bloc.dart';
import 'application/navbar/bloc/navbar_bloc.dart';

// const SAVE_KEY_NAME = 'UserLoggedIn';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(RecipeAdapter());
  // Hive.registerAdapter(CommentsAdapter());

  // await Hive.openBox<User>('users');
  await Hive.openBox<Recipe>('recipes');
  await Hive.openBox<Recipe>('favourites');
  // await Hive.openBox<Add>('recent');
  // await Hive.openBox<Comments>('comments');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RecipeBloc(),
        ),
        BlocProvider(
          create: (context) => FavouritesBloc(),
        ),
        BlocProvider(
          create: (context) => NavbarBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'TasteQ',
        theme: ThemeData(primarySwatch: Colors.red),
        home: BaseScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
