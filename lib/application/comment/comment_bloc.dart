import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/comment_model/comment.dart';
import '../../infrastructure/comments/comment_db.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc() : super(CommentInitial(commentList: commentList)) {
    on<AddComment>((event, emit) {
      // TODO: implement event handler
      commentList.add(event.comment);
      return emit(CommentState(commentList: commentList));
    });
  }
}
