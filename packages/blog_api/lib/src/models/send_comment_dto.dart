import 'package:json_annotation/json_annotation.dart';

part 'send_comment_dto.g.dart';

@JsonSerializable()
class SendCommentDTO {
  SendCommentDTO({
    required this.postId,
    required this.name,
    required this.email,
    required this.body,
  });

  int postId;
  String name;
  String email;
  String body;

  // ignore: sort_constructors_first
  factory SendCommentDTO.fromJson(Map<String, dynamic> json) =>
      _$SendCommentDTOFromJson(json);
  Map<String, dynamic> toJson() => _$SendCommentDTOToJson(this);
}
