import 'dart:ui';

import 'package:auth_repository/auth_repository.dart';
import 'package:blog_app/auth/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthDialog extends StatefulWidget {
  const AuthDialog({super.key});

  @override
  State<AuthDialog> createState() => _AuthDialogState();
}

class _AuthDialogState extends State<AuthDialog> with TickerProviderStateMixin {
  final double _sigmaX = 2;
  final double _sigmaY = 2;
  final double _opacity = 0.3;

  static const _animationDuration = 300;

  late AnimationController showDialogController;
  late Animation<double> showDialogAnimation;

  @override
  void initState() {
    showDialogController = AnimationController(
      duration: const Duration(milliseconds: _animationDuration),
      vsync: this,
    );

    showDialogAnimation = CurvedAnimation(
      parent: showDialogController,
      curve: Curves.easeInOutCubic,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (prev, current) =>
          prev.isLoading != current.isLoading || prev.error != current.error,
      builder: (context, state) {
        if (state.isLoading || state.error != AuthException.none) {
          return BlocListener<AuthBloc, AuthState>(
            listener: (_, state) {
              if (state.dismiss) {
                showDialogController.reverse().whenComplete(
                      () => context.read<AuthBloc>().add(AuthDialogDismissed()),
                    );
              }
            },
            child: Builder(
              builder: (context) {
                showDialogController.forward();
                return Stack(
                  children: [
                    GestureDetector(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return FadeTransition(
                            opacity: showDialogAnimation,
                            child: SizedBox(
                              height: constraints.maxHeight,
                              width: constraints.maxWidth,
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: _sigmaX,
                                  sigmaY: _sigmaY,
                                ),
                                child: ColoredBox(
                                  color: Colors.black.withOpacity(_opacity),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      onTap: () => context
                          .read<AuthBloc>()
                          .add(AuthDialogDismissRequested()),
                    ),
                    ScaleTransition(
                      scale: showDialogAnimation,
                      child: Center(
                        child: Container(
                          height: 170,
                          width: 170,
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Builder(
                              builder: (context) {
                                if (state.error != AuthException.none) {
                                  return Text(
                                    state.error.message,
                                    textAlign: TextAlign.center,
                                  );
                                }
                                return const CupertinoActivityIndicator();
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        }

        return const SizedBox();
      },
    );
  }

  @override
  void dispose() {
    showDialogController.dispose();
    super.dispose();
  }
}
