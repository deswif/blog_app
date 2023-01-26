import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blog_app/app/bloc/app_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:posts_repository/posts_repository.dart';

part 'post_details_event.dart';

part 'post_details_state.dart';

class PostDetailsBloc extends Bloc<PostDetailsEvent, PostDetailsState> {
  PostDetailsBloc({
    required Post post,
    required this.onPostChanged,
    required AppBloc appBloc,
  }) : super(PostDetailsState(post: post)) {
    on<CommentsLoadingRequested>(_onCommentsLoadingRequested);
    on<PublishCommentPressed>(_onPublishCommentPressed);
    on<PostDeleteRequested>(_onPostDeleteRequested);
    on<PostEditPressed>(_onPostEditPressed);
    on<_PostDetailsDismissRequested>(_onDismissRequested);
    on<_PostDetailsDeleteDismissRequested>(_onDeleteDismissRequested);
    on<PostDetailsBottomSheetDismissed>(_onBottomSheetDismissed);

    _postsRepository = GetIt.instance.get<PostsRepository>();
    _appBloc = appBloc;

    add(CommentsLoadingRequested());
  }

  final void Function() onPostChanged;
  late final PostsRepository _postsRepository;

  late final AppBloc _appBloc;

  Future<void> _onCommentsLoadingRequested(
    CommentsLoadingRequested event,
    Emitter<PostDetailsState> emit,
  ) async {
    emit(state.copyWith(isCommentsLoading: true));
    try {
      final comments = await _postsRepository.getComments(state.post.id!);
      emit(state.copyWith(comments: comments, error: LoadingError.none));
    } on LoadingError catch (e) {
      emit(state.copyWith(error: e));
    }
    emit(state.copyWith(isCommentsLoading: false));
  }

  Future<void> _onPublishCommentPressed(
    PublishCommentPressed event,
    Emitter<PostDetailsState> emit,
  ) async {
    emit(state.copyWith(isPublishCommentLoading: true));
    try {
      final user = _appBloc.state.user;
      final comment = Comment(
        postId: state.post.id!,
        name: user.name!,
        email: user.email!,
        body: event.content,
      );
      await _postsRepository.createComment(comment);
      add(_PostDetailsDismissRequested());
      add(CommentsLoadingRequested());
    } on LoadingError catch (e) {
      emit(state.copyWith(additionalError: e));
    }
    emit(state.copyWith(isPublishCommentLoading: false));
  }

  Future<void> _onPostDeleteRequested(
    PostDeleteRequested event,
    Emitter<PostDetailsState> emit,
  ) async {
    emit(state.copyWith(isDeleteLoading: true));
    try {
      await _postsRepository.deletePost(state.post.id!);
      onPostChanged.call();
      add(_PostDetailsDeleteDismissRequested());
    } on LoadingError catch (e) {
      emit(state.copyWith(additionalError: e));
    }
    emit(state.copyWith(isDeleteLoading: false));
  }

  Future<void> _onPostEditPressed(
    PostEditPressed event,
    Emitter<PostDetailsState> emit,
  ) async {
    emit(state.copyWith(isEditLoading: true));
    try {
      final post = Post(
        id: state.post.id,
        title: event.title,
        body: event.content,
      );
      await _postsRepository.updatePost(post);
      emit(state.copyWith(post: post));
      onPostChanged.call();
      add(_PostDetailsDismissRequested());
    } on LoadingError catch (e) {
      emit(state.copyWith(additionalError: e));
    }
    emit(state.copyWith(isEditLoading: false));
  }

  void _onDismissRequested(
    _PostDetailsDismissRequested event,
    Emitter<PostDetailsState> emit,
  ) {
    emit(state.copyWith(dismiss: true));
    emit(state.copyWith(dismiss: false));
  }

  void _onDeleteDismissRequested(
    _PostDetailsDeleteDismissRequested event,
    Emitter<PostDetailsState> emit,
  ) {
    emit(state.copyWith(dismissAfterDelete: true));
    emit(state.copyWith(dismissAfterDelete: false));
  }

  void _onBottomSheetDismissed(
    PostDetailsBottomSheetDismissed event,
    Emitter<PostDetailsState> emit,
  ) {
    emit(state.copyWith(additionalError: LoadingError.none));
  }
}
