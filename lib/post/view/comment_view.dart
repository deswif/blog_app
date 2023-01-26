import 'package:blog_app/app/app.dart';
import 'package:blog_app/post/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentView extends StatefulWidget {
  const CommentView({super.key});

  @override
  State<CommentView> createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final titleTextStyle =
        CupertinoTheme.of(context).textTheme.textStyle.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            );

    return PostDismissNotifier(
      child: AppBottomSheet(
        onWillPop: () => _onWillPop(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Text(
              'Comment',
              style: titleTextStyle,
            ),
            const SizedBox(height: 5),
            Expanded(
              child: AppTextField(
                lock: _lockGestures(context),
                controller: _controller,
                maxLines: null,
                onChanged: (_) {
                  setState(() {});
                },
              ),
            ),
            const SizedBox(height: 10),
            const PostErrorText(),
            const SizedBox(height: 10),
            CommentPublishButton(
              onPressed: !_isButtonAvailable()
                  ? null
                  : () {
                      _publishAction(context);
                    },
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _onWillPop(BuildContext context) {
    context.read<PostDetailsBloc>().add(PostDetailsBottomSheetDismissed());
    return Future.value(true);
  }

  void _publishAction(BuildContext context) {
    return context.read<PostDetailsBloc>().add(
          PublishCommentPressed(
            content: _controller.text.trim(),
          ),
        );
  }

  bool _lockGestures(BuildContext context) {
    final state = context.read<PostDetailsBloc>().state;
    return state.isPublishCommentLoading;
  }

  bool _isButtonAvailable() {
    final comment = _controller.text.trim();
    return comment != '' && comment.length < 3000;
  }
}
