import 'package:flutter/cupertino.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      borderRadius: BorderRadius.circular(10),
      onPressed: onPressed,
      child: const Text('Go on'),
    );
  }
}
