import 'package:json_annotation/json_annotation.dart';

part 'comment_dto.g.dart';

@JsonSerializable()
class CommentDTO {
  CommentDTO({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  int postId;
  int id;
  String name;
  String email;
  String body;

  // ignore: sort_constructors_first
  factory CommentDTO.fromJson(Map<String, dynamic> json) =>
      _$CommentDTOFromJson(json);
  Map<String, dynamic> toJson() => _$CommentDTOToJson(this);
}
