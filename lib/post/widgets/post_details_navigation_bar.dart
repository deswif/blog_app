import 'package:flutter/cupertino.dart';

class PostDetailsNavigationBar extends StatelessWidget {
  const PostDetailsNavigationBar({super.key, required this.onEditPressed});

  final void Function() onEditPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoSliverNavigationBar(
      previousPageTitle: 'Back',
      largeTitle: const Text('Detail'),
      backgroundColor:
          CupertinoTheme.of(context).scaffoldBackgroundColor.withOpacity(0.6),
      trailing: CupertinoButton(
        padding: EdgeInsets.zero,
        minSize: 0,
        onPressed: onEditPressed,
        child: const Text('Edit'),
      ),
    );
  }
}
