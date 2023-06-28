import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasteq_bloc/infrastructure/recent_db/recent_db.dart';
import '../../domain/recipe_model/recipe.dart';
part 'recent_event.dart';
part 'recent_state.dart';

class RecentBloc extends Bloc<RecentEvent, RecentState> {
  RecentBloc() : super(RecentInitial(recentList: recentsList)) {
    on<AddToRecent>((event, emit) {
      recentsList.add(event.recipe);
      return emit(RecentState(recentList: recentsList));
    });
  }
}
