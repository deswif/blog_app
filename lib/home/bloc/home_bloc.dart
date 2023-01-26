import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:posts_repository/posts_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<HomeLoadingRequested>(_onLoadingRequested);
    on<HomePostCreatePressed>(_onPostCreatePressed);
    on<HomeDialogDismissed>(_onHomeDialogDismissed);

    _repository = GetIt.instance.get<PostsRepository>();
    add(HomeLoadingRequested());
  }

  late final PostsRepository _repository;

  Future<void> _onLoadingRequested(
    HomeLoadingRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      final posts = await _repository.getPosts();
      emit(state.copyWith(posts: posts, isLoading: false));
    } on LoadingError catch (e) {
      emit(state.copyWith(error: e, isLoading: false));
    }
  }

  Future<void> _onPostCreatePressed(
    HomePostCreatePressed event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isPostUploading: true));

    try {
      final post = Post(title: event.title, body: event.content);
      await _repository.createPost(post);
      emit(state.copyWith(isPostUploading: false));
      add(HomeLoadingRequested());
    } on LoadingError catch (e) {
      emit(state.copyWith(error: e, isPostUploading: false));
    }
  }

  void _onHomeDialogDismissed(
    HomeDialogDismissed event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(error: LoadingError.none));
  }
}
