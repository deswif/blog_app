import 'package:blog_app/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_repository/posts_repository.dart';

class HomeErrorNotifier extends StatelessWidget {
  const HomeErrorNotifier({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.error != LoadingError.none) {
          _showErrorDialog(context);
        }
      },
      child: child,
    );
  }

  void _showErrorDialog(BuildContext context) {
    final bloc = context.read<HomeBloc>();
    showCupertinoDialog<void>(
      context: context,
      builder: (dialogContext) {
        return _HomeError(
          content: bloc.state.error.message,
          onPressed: () {
            bloc.add(HomeDialogDismissed());
            Navigator.pop(dialogContext);
          },
        );
      },
    );
  }
}

class _HomeError extends StatelessWidget {
  const _HomeError({
    required this.content,
    required this.onPressed,
  });

  final String content;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Ooops..'),
      content: Text(content),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: onPressed,
          child: const Text('Ok'),
        )
      ],
    );
  }
}
