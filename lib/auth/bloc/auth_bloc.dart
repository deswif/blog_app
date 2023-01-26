import 'dart:developer';

import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';

import 'package:blog_app/auth/models/page_model.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get_it/get_it.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<AuthButtonPressed>(_onButtonPressed);
    on<AuthDialogDismissRequested>(_onDialogDismissRequested);
    on<AuthDialogDismissed>(_onDialogDismissed);
    on<AuthPageToggled>(_onPageToggled);

    _authRepository = GetIt.instance.get<AuthRepository>();
  }

  late final AuthRepository _authRepository;

  Future<void> _onButtonPressed(
    AuthButtonPressed event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final password = event.password.trim();
    if (!EmailValidator.validate(event.email)) {
      emit(
        state.copyWith(
          isLoading: false,
          error: const AuthException(message: 'Incorrect email format'),
        ),
      );
      log('Password incorrect format');
      return;
    }

    if (password == '' || password.length < 6) {
      emit(
        state.copyWith(
          isLoading: false,
          error: const AuthException(message: 'Incorrect password format'),
        ),
      );
      log('Email incorrect format');
      return;
    }

    if (state.authPage == AuthPageModel.login) {
      try {
        await _authRepository.logInWithEmailAndPassword(
          email: event.email,
          password: password,
        );
      } on AuthException catch (e) {
        emit(
          state.copyWith(
            isLoading: false,
            error: e,
          ),
        );
      }
    } else {
      try {
        await _authRepository.signUp(
          email: event.email,
          password: password,
        );
      } on AuthException catch (e) {
        emit(
          state.copyWith(
            isLoading: false,
            error: e,
          ),
        );
      }
    }

    emit(state.copyWith(isLoading: false));
  }

  void _onDialogDismissRequested(
    AuthDialogDismissRequested event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(dismiss: true));
  }

  void _onDialogDismissed(
    AuthDialogDismissed event,
    Emitter<AuthState> emit,
  ) {
    emit(
      state.copyWith(
        isLoading: false,
        dismiss: false,
        error: AuthException.none,
      ),
    );
  }

  void _onPageToggled(
    AuthPageToggled event,
    Emitter<AuthState> emit,
  ) {
    emit(
      state.copyWith(
        authPage: state.authPage.opposite(),
      ),
    );
  }
}
