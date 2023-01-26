import 'package:equatable/equatable.dart';

class LoadingError extends Equatable implements Exception {
  const LoadingError({required this.message});

  static const none = LoadingError(message: '');

  final String message;

  bool get isEmpty => this == LoadingError.none;

  @override
  List<Object?> get props => [message];
}
