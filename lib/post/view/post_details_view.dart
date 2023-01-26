import 'package:blog_app/app/app.dart';
import 'package:blog_app/post/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:posts_repository/posts_repository.dart';

class PostDetailsPage extends StatelessWidget {
  const PostDetailsPage({
    super.key,
    required Post post,
    required void Function() onPostChanged,
  })  : _post = post,
        _onPostChanged = onPostChanged;

  final Post _post;
  final void Function() _onPostChanged;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostDetailsBloc(
        post: _post,
        onPostChanged: _onPostChanged,
        appBloc: context.read<AppBloc>(),
      ),
      child: const PostDetailsView(),
    );
  }
}

class PostDetailsView extends StatelessWidget {
  const PostDetailsView({super.key});

  static const double _horizontalPadding = 20;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: WithFloatingButton(
        icon: CupertinoIcons.chat_bubble_text,
        onPressed: () => _onAddCommentPressed(context),
        child: BlocBuilder<PostDetailsBloc, PostDetailsState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                PostDetailsNavigationBar(
                  onEditPressed: () => _onEditPressed(context),
                ),
                CupertinoSliverRefreshControl(
                  onRefresh: () async => _onRefresh(context),
                ),
                const PostDetailsCard(horizontalPadding: _horizontalPadding),
                const PostDetailsContent(horizontalPadding: _horizontalPadding),
              ],
            );
          },
        ),
      ),
    );
  }

  void _onRefresh(BuildContext context) {
    context.read<PostDetailsBloc>().add(CommentsLoadingRequested());
  }

  void _onAddCommentPressed(BuildContext context) {
    showCupertinoModalBottomSheet<bool>(
      context: context,
      duration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      builder: (_) {
        return BlocProvider.value(
          value: context.read<PostDetailsBloc>(),
          child: const CommentView(),
        );
      },
    );
  }

  void _onEditPressed(BuildContext context) {
    showCupertinoModalBottomSheet<bool>(
      context: context,
      duration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      builder: (_) {
        final bloc = context.read<PostDetailsBloc>();
        return BlocProvider.value(
          value: bloc,
          child: PostEditView(
            title: bloc.state.post.title,
            content: bloc.state.post.body,
          ),
        );
      },
    ).then((deleted) {
      if (deleted == null) return;
      if (deleted) {
        Navigator.pop(context);
      }
    });
  }
}
