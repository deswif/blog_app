import 'package:equatable/equatable.dart';

class AuthException extends Equatable implements Exception {
  const AuthException({required this.message});

  static const none = AuthException(message: '');

  final String message;

  bool get isEmpty => this == AuthException.none;

  @override
  List<Object?> get props => [message];
}
