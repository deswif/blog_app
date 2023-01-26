import 'package:blog_app/home/home.dart';
import 'package:blog_app/post/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:posts_repository/posts_repository.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      pressedOpacity: 0.6,
      onPressed: () {
        Navigator.push(
          context,
          MaterialWithModalsPageRoute<void>(
            builder: (_) {
              return PostDetailsPage(
                post: post,
                onPostChanged: () {
                  context.read<HomeBloc>().add(HomeLoadingRequested());
                },
              );
            },
          ),
        );
      },
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title,
                  style: CupertinoTheme.of(context)
                      .textTheme
                      .textStyle
                      .copyWith(fontSize: 28, fontWeight: FontWeight.w500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Text(
                    post.body,
                    style:
                        CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: CupertinoColors.white.withOpacity(0.8),
                            ),
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
