import 'package:blog_api/src/models/comment_dto.dart';

// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'embed_post_response.g.dart';

@JsonSerializable()
class EmbedPostResponse {
  EmbedPostResponse({
    required this.id,
    required this.title,
    required this.body,
    required this.comments,
  });

  int id;
  String title;
  String body;
  List<CommentDTO> comments;

  // ignore: sort_constructors_first
  factory EmbedPostResponse.fromJson(Map<String, dynamic> json) =>
      _$EmbedPostResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EmbedPostResponseToJson(this);
}
