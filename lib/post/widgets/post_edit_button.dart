import 'package:blog_app/post/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostEditButton extends StatelessWidget {
  const PostEditButton({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostDetailsBloc, PostDetailsState>(
      builder: (context, state) {
        return Center(
          child: state.isEditLoading
              ? const CupertinoActivityIndicator()
              : CupertinoButton.filled(
                  onPressed: onPressed,
                  child: const Text('Edit'),
                ),
        );
      },
    );
  }
}
