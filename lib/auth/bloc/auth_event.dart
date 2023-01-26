part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthButtonPressed extends AuthEvent {
  AuthButtonPressed({required this.email, required this.password});

  final String email;
  final String password;
}

class AuthDialogDismissRequested extends AuthEvent {}

class AuthDialogDismissed extends AuthEvent {}

class AuthPageToggled extends AuthEvent {}
