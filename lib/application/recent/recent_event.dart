part of 'recent_bloc.dart';

@immutable
abstract class RecentEvent {}

class AddToRecent extends RecentEvent {
  final Recipe recipe;

  AddToRecent({required this.recipe});
}
