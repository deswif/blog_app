part of 'home_bloc.dart';

abstract class HomeEvent {}

class HomeLoadingRequested extends HomeEvent {}

class HomePostCreatePressed extends HomeEvent {
  HomePostCreatePressed({
    required this.title,
    required this.content,
  });

  final String title;
  final String content;
}

class HomeDialogDismissed extends HomeEvent {}
