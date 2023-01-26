import 'package:blog_app/post/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostDetailsContent extends StatelessWidget {
  const PostDetailsContent({super.key, required this.horizontalPadding});

  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostDetailsBloc, PostDetailsState>(
      builder: (context, state) {
        if (state.isCommentsLoading) {
          return const SliverFillRemaining(
            child: Center(
              child: CupertinoActivityIndicator(),
            ),
          );
        }

        return SliverPadding(
          padding: EdgeInsets.only(
            left: horizontalPadding,
            right: horizontalPadding + 40,
          ),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final comment = state.comments[index];
                return CommentCard(comment: comment);
              },
              childCount: state.comments.length,
            ),
          ),
        );
      },
    );
  }
}
