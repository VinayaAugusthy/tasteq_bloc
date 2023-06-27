import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../domain/comment_model/comment.dart';

List<Comments> commentList = [];

getComments() {
  final commentDB = Hive.box<Comments>('comments');
  commentList.clear();
  commentList.addAll(commentDB.values);
}

createComment(Comments newComment, BuildContext context) async {
  // final users = getUsers();
  final commentDB = Hive.box<Comments>('comments');
  // BlocProvider.of<Comments>(context).add;
  getComments();
  print(newComment);
}
