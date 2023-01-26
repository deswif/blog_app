import 'package:blog_app/post/bloc/post_details_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_repository/posts_repository.dart';

class PostDetailsCard extends StatelessWidget {
  const PostDetailsCard({super.key, required this.horizontalPadding});

  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostDetailsBloc, PostDetailsState>(
      builder: (context, state) {
        return SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
          ),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.post.title,
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .textStyle
                            .copyWith(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        state.post.body,
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .textStyle
                            .copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    // ignore: lines_longer_than_80_chars
                    'Comments: ${state.isCommentsLoading ? '...' : state.comments.length}',
                  ),
                ),
                const SizedBox(height: 10),
                if (state.error != LoadingError.none)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      state.error.message,
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .textStyle
                          .copyWith(
                            color: CupertinoColors.destructiveRed,
                            fontSize: 15,
                          ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
