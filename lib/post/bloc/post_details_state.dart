part of 'post_details_bloc.dart';

class PostDetailsState {
  PostDetailsState({
    required this.post,
    this.comments = const [],
    this.isCommentsLoading = false,
    this.isPublishCommentLoading = false,
    this.isEditLoading = false,
    this.isDeleteLoading = false,
    this.dismiss = false,
    this.dismissAfterDelete = false,
    this.error = LoadingError.none,
    this.additionalError = LoadingError.none,
  });

  final Post post;
  final List<Comment> comments;
  final bool isCommentsLoading;
  final bool isPublishCommentLoading;
  final bool isEditLoading;
  final bool isDeleteLoading;
  final bool dismiss;
  final bool dismissAfterDelete;
  final LoadingError error;
  final LoadingError additionalError;

  PostDetailsState copyWith({
    Post? post,
    List<Comment>? comments,
    bool? isCommentsLoading,
    bool? isPublishCommentLoading,
    bool? isEditLoading,
    bool? isDeleteLoading,
    bool? dismiss,
    bool? dismissAfterDelete,
    LoadingError? error,
    LoadingError? additionalError,
  }) {
    return PostDetailsState(
      post: post ?? this.post,
      comments: comments ?? this.comments,
      isCommentsLoading: isCommentsLoading ?? this.isCommentsLoading,
      isPublishCommentLoading:
          isPublishCommentLoading ?? this.isPublishCommentLoading,
      isEditLoading: isEditLoading ?? this.isEditLoading,
      isDeleteLoading: isDeleteLoading ?? this.isDeleteLoading,
      dismiss: dismiss ?? this.dismiss,
      dismissAfterDelete: dismissAfterDelete ?? this.dismissAfterDelete,
      error: error ?? this.error,
      additionalError: additionalError ?? this.additionalError,
    );
  }

  @override
  String toString() {
    return 'PostDetailsState(post: ${post.runtimeType}, '
        'comments: ${comments.length}, '
        'isCommentsLoading: $isCommentsLoading, '
        'isPublishCommentLoading: $isPublishCommentLoading, '
        'isEditLoading: $isEditLoading, isDeleteLoading: $isDeleteLoading, '
        'dismiss: $dismiss, dismissAfterDelete: $dismissAfterDelete, '
        'error: $error, additionalError: $additionalError)';
  }
}
