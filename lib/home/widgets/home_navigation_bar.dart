import 'package:blog_app/home/bloc/home_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeNavigationBar extends StatelessWidget {
  const HomeNavigationBar({
    super.key,
    required this.onLogOutPressed,
    required this.onRefreshPressed,
  });

  final void Function() onLogOutPressed;
  final void Function() onRefreshPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoSliverNavigationBar(
      largeTitle: const Text('Posts'),
      backgroundColor:
          CupertinoTheme.of(context).scaffoldBackgroundColor.withOpacity(0.6),
      leading: CupertinoButton(
        padding: EdgeInsets.zero,
        minSize: 0,
        onPressed: onLogOutPressed,
        child: const Text('Log out'),
      ),
      trailing: CupertinoButton(
        padding: EdgeInsets.zero,
        minSize: 0,
        onPressed: onRefreshPressed,
        child: Builder(
          builder: (context) {
            return context.read<HomeBloc>().state.isLoading
                ? const CupertinoActivityIndicator()
                : const Text('Refresh');
          },
        ),
      ),
    );
  }
}
