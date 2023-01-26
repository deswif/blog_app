part of 'auth_bloc.dart';

class AuthState {
  const AuthState({
    this.error = AuthException.none,
    this.dismiss = false,
    this.isLoading = false,
    this.authPage = AuthPageModel.login,
  });

  final AuthException error;

  final bool dismiss;
  final bool isLoading;

  final AuthPageModel authPage;

  AuthState copyWith({
    AuthException? error,
    bool? dismiss,
    bool? isLoading,
    AuthPageModel? authPage,
  }) {
    return AuthState(
      error: error ?? this.error,
      dismiss: dismiss ?? this.dismiss,
      isLoading: isLoading ?? this.isLoading,
      authPage: authPage ?? this.authPage,
    );
  }

  @override
  String toString() {
    return 'AuthState(error: $error, dismiss: $dismiss, '
        'isLoading: $isLoading, authPage: $authPage)';
  }
}
