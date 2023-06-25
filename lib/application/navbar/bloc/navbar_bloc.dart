import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navbar_event.dart';
part 'navbar_state.dart';

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  NavbarBloc() : super(NavbarInitial(navIndex: 0)) {
    on<OnTapped>((event, emit) {
      emit(NavbarState(navIndex: event.navIndex));
    });
  }
}
