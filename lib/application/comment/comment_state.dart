part of 'comment_bloc.dart';

class CommentState {
  final List<Comments> commentList;

  CommentState({required this.commentList});
}

class CommentInitial extends CommentState {
  CommentInitial({required super.commentList});
}
