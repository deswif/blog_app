import 'package:blog_app/post/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostDismissNotifier extends StatelessWidget {
  const PostDismissNotifier({
    super.key,
    required this.child,
    this.withDeleting = false,
  });

  final Widget child;
  final bool withDeleting;

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostDetailsBloc, PostDetailsState>(
      listener: (context, state) {
        if (state.dismiss) {
          Navigator.pop(context);
        }

        if (withDeleting && state.dismissAfterDelete) {
          Navigator.pop(context, true);
        }
      },
      child: child,
    );
  }
}
