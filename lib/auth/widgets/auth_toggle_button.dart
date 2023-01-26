import 'package:blog_app/auth/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthToggleButton extends StatelessWidget {
  const AuthToggleButton({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Text(
            state.authPage.getDescription(),
            style: CupertinoTheme.of(context)
                .textTheme
                .actionTextStyle
                .copyWith(fontSize: 14),
          );
        },
      ),
    );
  }
}
