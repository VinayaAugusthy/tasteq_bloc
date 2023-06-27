part of 'recent_bloc.dart';

class RecentState {
  final List<Recipe> recentList;

  RecentState({required this.recentList});
}

class RecentInitial extends RecentState {
  RecentInitial({required super.recentList});
}
