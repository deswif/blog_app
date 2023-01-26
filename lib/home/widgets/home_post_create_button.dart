import 'package:blog_app/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePostCreateButton extends StatelessWidget {
  const HomePostCreateButton({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.isPostUploading) {
            return const CupertinoActivityIndicator();
          }

          return CupertinoButton.filled(
            onPressed: onPressed,
            child: const Text('Post'),
          );
        },
      ),
    );
  }
}
