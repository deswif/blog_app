part of 'post_details_bloc.dart';

abstract class PostDetailsEvent {}

class CommentsLoadingRequested extends PostDetailsEvent {}

class PublishCommentPressed extends PostDetailsEvent {
  PublishCommentPressed({required this.content});

  final String content;
}

class PostDeleteRequested extends PostDetailsEvent {}

class PostEditPressed extends PostDetailsEvent {
  PostEditPressed({
    required this.title,
    required this.content,
  });

  final String title;
  final String content;
}

class PostDetailsBottomSheetDismissed extends PostDetailsEvent {}

class _PostDetailsDismissRequested extends PostDetailsEvent {}

class _PostDetailsDeleteDismissRequested extends PostDetailsEvent {}
