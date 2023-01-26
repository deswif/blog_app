import 'package:blog_app/auth/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: const AuthView(),
    );
  }
}

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: AuthDialogNotifier(
        child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            CupertinoSliverNavigationBar(
              backgroundColor:
                  CupertinoTheme.of(context).scaffoldBackgroundColor,
              largeTitle: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return Text(state.authPage.getTitle());
                },
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              sliver: SliverFillRemaining(
                hasScrollBody: false,
                child: AuthContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
