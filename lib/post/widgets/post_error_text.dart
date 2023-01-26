import 'package:blog_app/post/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_repository/posts_repository.dart';

class PostErrorText extends StatelessWidget {
  const PostErrorText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostDetailsBloc, PostDetailsState>(
      builder: (context, state) {
        if (state.additionalError == LoadingError.none) {
          return const SizedBox();
        }

        return Text(
          state.additionalError.message,
          style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                color: CupertinoColors.destructiveRed,
                fontSize: 15,
              ),
        );
      },
    );
  }
}
