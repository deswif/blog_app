import 'package:blog_app/app/app.dart';
import 'package:blog_app/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCreateView extends StatefulWidget {
  const PostCreateView({super.key});

  @override
  State<PostCreateView> createState() => _PostCreateState();
}

class _PostCreateState extends State<PostCreateView> {
  late final TextEditingController _titleController;
  late final TextEditingController _contentController;

  @override
  void initState() {
    _titleController = TextEditingController();
    _contentController = TextEditingController();
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

    return AppBottomSheet(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Text(
            'Title',
            style: titleTextStyle,
          ),
          const SizedBox(height: 5),
          AppTextField(
            controller: _titleController,
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 20),
          Text(
            'Content',
            style: titleTextStyle,
          ),
          const SizedBox(height: 5),
          Expanded(
            child: AppTextField(
              controller: _contentController,
              maxLines: null,
              onChanged: (_) => setState(() {}),
            ),
          ),
          const SizedBox(height: 20),
          HomePostCreateButton(
            onPressed: !_isButtonAvailable()
                ? null
                : () {
                    _postAction(context);
                  },
          ),
        ],
      ),
    );
  }

  void _postAction(BuildContext context) {
    final title = _titleController.text.trim();
    final content = _contentController.text.trim();
    context
        .read<HomeBloc>()
        .add(HomePostCreatePressed(title: title, content: content));
    Navigator.pop<bool>(context, true);
  }

  bool _isButtonAvailable() {
    final title = _titleController.text.trim();
    final content = _contentController.text.trim();
    return title != '' &&
        title.length < 100 &&
        content != '' &&
        content.length < 3000;
  }
}
