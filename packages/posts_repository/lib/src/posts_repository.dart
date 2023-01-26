import 'package:blog_api/blog_api.dart';
import 'package:dio/dio.dart';
import 'package:posts_repository/src/models/models.dart';
import 'package:posts_repository/src/utils/comment_mapper.dart';
import 'package:posts_repository/src/utils/post_mapper.dart';

class PostsRepository {
  PostsRepository() {
    final dio = Dio();
    _api = BlogApi(dio);
  }

  late final BlogApi _api;

  Future<void> createPost(Post post) async {
    try {
      final dto = post.toDTO();
      await _api.createPost(dto);
    } catch (_) {
      throw const LoadingError(
        message: 'Something went wrong while creating a post',
      );
    }
  }

  Future<List<Post>> getPosts() async {
    try {
      final dtoList = await _api.getPosts();
      final posts = dtoList.map((dto) {
        return dto.toPost();
      }).toList();
      return posts;
    } catch (_) {
      throw const LoadingError(
        message: 'Something went wrong while fetching posts',
      );
    }
  }

  Future<List<Comment>> getComments(int postId) async {
    try {
      final response = await _api.getComments(postId);
      final comments = response.comments.map((dto) {
        return dto.toComment();
      }).toList();
      return comments;
    } catch (_) {
      throw const LoadingError(
        message: 'Something went wrong while fetching comments',
      );
    }
  }

  Future<void> updatePost(Post post) async {
    try {
      final dto = post.toDTO();
      await _api.updatePost(post.id!, dto);
    } catch (_) {
      throw const LoadingError(
        message: 'Something went wrong while updating a post',
      );
    }
  }

  Future<void> deletePost(int postId) async {
    try {
      await _api.deletePost(postId);
    } catch (_) {
      throw const LoadingError(
        message: 'Something went wrong while deleting a post',
      );
    }
  }

  Future<void> createComment(Comment comment) async {
    try {
      final dto = comment.toDTO();
      await _api.createComment(dto);
    } catch (_) {
      throw const LoadingError(
        message: 'Something went wrong while creating a comment',
      );
    }
  }
}
