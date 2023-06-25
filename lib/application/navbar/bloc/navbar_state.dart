part of 'navbar_bloc.dart';

@immutable
class NavbarState {
  final int navIndex;

  NavbarState({required this.navIndex});
}

class NavbarInitial extends NavbarState {
  NavbarInitial({required super.navIndex});
}
