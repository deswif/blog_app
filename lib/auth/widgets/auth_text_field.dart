import 'package:auth_repository/auth_repository.dart';
import 'package:blog_app/app/app.dart';
import 'package:blog_app/auth/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.controller,
    this.placeholder,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final String? placeholder;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return AppTextField(
          lock: state.isLoading || state.error != AuthException.none,
          controller: controller,
          placeholder: placeholder,
          obscureText: obscureText,
        );
      },
    );
  }
}
