import 'package:blog_api/src/models/models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'blog_api.g.dart';

@RestApi(baseUrl: 'https://blog-api-t6u0.onrender.com')
abstract class BlogApi {
  factory BlogApi(Dio dio, {String baseUrl}) = _BlogApi;

  @POST('/posts')
  Future<void> createPost(
    @Body() SendPostDTO postDTO,
  );

  @GET('/posts')
  Future<List<PostDTO>> getPosts();

  @GET('/posts/{postId}?_embed=comments')
  Future<EmbedPostResponse> getComments(
    @Path('postId') int postId,
  );

  @PUT('/posts/{postId}')
  Future<void> updatePost(
    @Path('postId') int postId,
    @Body() SendPostDTO postDTO,
  );

  @DELETE('/posts/{postId}')
  Future<void> deletePost(
    @Path('postId') int postId,
  );

  @POST('/comments')
  Future<void> createComment(
    @Body() SendCommentDTO commentDTO,
  );
}
