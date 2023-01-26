import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({
    super.key,
    required this.child,
    this.onWillPop,
  });

  final Widget child;
  final Future<bool> Function()? onWillPop;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop ??
          () {
            return Future.value(true);
          },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: FractionallySizedBox(
          heightFactor: 0.93,
          child: CupertinoPageScaffold(
            backgroundColor: Colors.grey.shade900,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
