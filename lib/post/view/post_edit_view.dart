import 'package:blog_app/app/app.dart';
import 'package:blog_app/post/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostEditView extends StatefulWidget {
  const PostEditView({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  State<PostEditView> createState() => _PostEditViewState();
}

class _PostEditViewState extends State<PostEditView> {
  late final TextEditingController _titleController;
  late final TextEditingController _contentController;

  @override
  void initState() {
    _titleController = TextEditingController(text: widget.title);
    _contentController = TextEditingController(text: widget.content);
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
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
      withDeleting: true,
      child: AppBottomSheet(
        onWillPop: () => _onWillPop(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            PostDeleteButton(
              onPressed: !_lockGestures(context)
                  ? () {
                      _deleteAction(context);
                    }
                  : null,
            ),
            const SizedBox(height: 20),
            Text(
              'Title',
              style: titleTextStyle,
            ),
            const SizedBox(height: 5),
            AppTextField(
              lock: _lockGestures(context),
              controller: _titleController,
              onChanged: (_) {
                setState(() {});
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Content',
              style: titleTextStyle,
            ),
            const SizedBox(height: 5),
            Expanded(
              child: AppTextField(
                lock: _lockGestures(context),
                controller: _contentController,
                maxLines: null,
                onChanged: (_) {
                  setState(() {});
                },
              ),
            ),
            const SizedBox(height: 10),
            const PostErrorText(),
            const SizedBox(height: 10),
            PostEditButton(
              onPressed: _isButtonAvailable() && !_lockGestures(context)
                  ? () {
                      _editAction(context);
                    }
                  : null,
            )
          ],
        ),
      ),
    );
  }

  Future<bool> _onWillPop(BuildContext context) {
    context.read<PostDetailsBloc>().add(PostDetailsBottomSheetDismissed());
    return Future.value(true);
  }

  void _editAction(BuildContext context) {
    final title = _titleController.text.trim();
    final content = _contentController.text.trim();
    context.read<PostDetailsBloc>().add(
          PostEditPressed(
            title: title,
            content: content,
          ),
        );
  }

  void _deleteAction(BuildContext context) {
    context.read<PostDetailsBloc>().add(PostDeleteRequested());
  }

  bool _lockGestures(BuildContext context) {
    final state = context.read<PostDetailsBloc>().state;
    return state.isEditLoading || state.isDeleteLoading;
  }

  bool _isButtonAvailable() {
    final title = _titleController.text.trim();
    final content = _contentController.text.trim();
    return title != '' &&
        title.length < 100 &&
        content != '' &&
        content.length < 3000 &&
        _isPostChanged();
  }

  bool _isPostChanged() {
    final title = _titleController.text.trim();
    final content = _contentController.text.trim();
    return title != widget.title || content != widget.content;
  }
}
