import 'package:blog_app/post/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostDeleteButton extends StatelessWidget {
  const PostDeleteButton({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostDetailsBloc, PostDetailsState>(
      builder: (context, state) {
        return CupertinoButton(
          padding: EdgeInsets.zero,
          minSize: 0,
          onPressed: onPressed,
          child: state.isDeleteLoading
              ? const CupertinoActivityIndicator()
              : Text(
                  'Delete',
                  style:
                      CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: CupertinoColors.destructiveRed,
                          ),
                ),
        );
      },
    );
  }
}
