part of 'navbar_bloc.dart';

@immutable
abstract class NavbarEvent {
  final int navIndex;

  NavbarEvent({required this.navIndex});
}

class OnTapped extends NavbarEvent {
  OnTapped({required super.navIndex});
}
