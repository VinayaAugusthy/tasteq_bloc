import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tasteq_bloc/application/recent/recent_bloc.dart';
import 'package:tasteq_bloc/application/recipe/recipe_bloc.dart';
import 'package:tasteq_bloc/domain/authentication_model/authentication.dart';
import 'package:tasteq_bloc/domain/recipe_model/recipe.dart';
import 'package:tasteq_bloc/presentation/screens/splash_screen/splashscreen.dart';
import 'application/favourites/favourites_bloc.dart';
import 'application/navbar/bloc/navbar_bloc.dart';
import 'domain/comment_model/comment.dart';

// ignore: constant_identifier_names
const SAVE_KEY_NAME = 'UserLoggedIn';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(AuthenticationAdapter());
  Hive.registerAdapter(RecipeAdapter());
  Hive.registerAdapter(CommentsAdapter());

  await Hive.openBox<Authentication>('authentication');
  await Hive.openBox<Recipe>('recipes');
  await Hive.openBox<Recipe>('favourites');
  await Hive.openBox<Recipe>('recent');
  await Hive.openBox<Comments>('comments');

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
        BlocProvider(
          create: (context) => RecentBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'TasteQ',
        theme: ThemeData(primarySwatch: Colors.red),
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
