part of 'comment_bloc.dart';

@immutable
abstract class CommentEvent {}

class AddComment extends CommentEvent {
  final Comments comment;

  AddComment({required this.comment});
}
