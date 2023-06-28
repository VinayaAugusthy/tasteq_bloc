import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:tasteq_bloc/application/comment/comment_bloc.dart';
import 'package:tasteq_bloc/domain/comment_model/comment.dart';

List<Comments> commentList = [];

addComment(Comments value, BuildContext context) {
  final commentsDB = Hive.box<Comments>('comments');
  BlocProvider.of<CommentBloc>(context).add(AddComment(comment: value));
  commentsDB.add(value);
  getAllComments();
}

getAllComments() {
  final commentsDB = Hive.box<Comments>('comments');
  commentList.clear();
  commentList.addAll(commentsDB.values);
}

onClickedAddComment(
    String commentTextController, username, recipename, BuildContext context) {
  final userName = username;
  final recipeName = recipename;

  final comment = Comments(
      userName: userName,
      recipeName: recipeName,
      comment: commentTextController);
  addComment(comment, context);
}
