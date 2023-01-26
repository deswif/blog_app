import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:posts_repository/posts_repository.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({super.key, required this.comment});

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 20),
      constraints: const BoxConstraints(
        minHeight: 80,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade800,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            comment.name,
            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
          ),
          Text(
            comment.email,
            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: CupertinoColors.white.withOpacity(0.4),
                ),
          ),
          const SizedBox(height: 5),
          Text(
            comment.body,
            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ],
      ),
    );
  }
}
