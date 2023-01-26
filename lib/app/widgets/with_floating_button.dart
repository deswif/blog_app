import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WithFloatingButton extends StatelessWidget {
  const WithFloatingButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.child,
  });

  final IconData icon;
  final void Function() onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        SafeArea(
          child: Align(
            alignment: Alignment.bottomRight,
            child: CupertinoButton(
              onPressed: onPressed,
              child: CircleAvatar(
                backgroundColor: CupertinoTheme.of(context).primaryColor,
                radius: 30,
                child: Icon(
                  icon,
                  color: CupertinoColors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
