import 'package:flutter/material.dart';
import 'package:tasteq_bloc/presentation/screens/favourite_screen/fav_scren.dart';
import 'package:tasteq_bloc/presentation/screens/home/home_screen.dart';
import 'package:tasteq_bloc/presentation/screens/upload/upload.dart';

final navItems = [
  const HomeScreen(),
  const UploadRecipe(),
  const FavouriteScren()
];
final categoryItems = [
  'Breakfast',
  'Lunch',
  'Dinner',
  'Indian',
  'Chinese',
  'Italian'
];
const heightBox10 = SizedBox(height: 10);
const heightBox20 = SizedBox(height: 20);
const heightBox30 = SizedBox(height: 30);
int index = 0;
String? usname;
