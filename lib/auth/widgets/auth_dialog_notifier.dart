import 'package:blog_app/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthDialogNotifier extends StatelessWidget {
  const AuthDialogNotifier({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (prev, current) =>
          prev.isLoading != current.isLoading || prev.error != current.error,
      builder: (context, state) {
        return Stack(
          children: [
            child,
            const AuthDialog(),
          ],
        );
      },
    );
  }
}
