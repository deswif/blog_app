part of 'home_bloc.dart';

class HomeState {
  HomeState({
    this.posts = const [],
    this.isLoading = false,
    this.error = LoadingError.none,
    this.isPostUploading = false,
  });

  final List<Post> posts;
  final bool isLoading;
  final bool isPostUploading;
  final LoadingError error;

  HomeState copyWith({
    List<Post>? posts,
    bool? isLoading,
    bool? isPostUploading,
    LoadingError? error,
  }) {
    return HomeState(
      posts: posts ?? this.posts,
      isLoading: isLoading ?? this.isLoading,
      isPostUploading: isPostUploading ?? this.isPostUploading,
      error: error ?? this.error,
    );
  }

  @override
  String toString() {
    return 'HomeState(posts: ${posts.length}, isLoading: $isLoading, '
        'isPostLoading: $isPostUploading, error: $error)';
  }
}
