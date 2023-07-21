// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../domain/comment_model/comment.dart';

ValueNotifier<List<Comments>> commentNotifier = ValueNotifier([]);

Future getComments() async {
  final commentDB = await Hive.openBox<Comments>('comments');
  final allcomments = commentDB.values.toList();
  commentNotifier.value.clear();
  commentNotifier.value.addAll(allcomments);
  commentNotifier.notifyListeners();
}

createComment(Comments newComment) async {
  // final users = getUsers();
  final commentDB = await Hive.openBox<Comments>('comments');
  await commentDB.add(newComment);
  getComments();
}
