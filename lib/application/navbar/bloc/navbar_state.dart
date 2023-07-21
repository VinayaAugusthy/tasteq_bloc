part of 'navbar_bloc.dart';

@immutable
class NavbarState {
  final int navIndex;

  const NavbarState({required this.navIndex});
}

class NavbarInitial extends NavbarState {
  const NavbarInitial({required super.navIndex});
}
