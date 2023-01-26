// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'post_dto.g.dart';

@JsonSerializable()
class PostDTO {
  PostDTO({
    required this.id,
    required this.title,
    required this.body,
  });

  int id;
  String title;
  String body;

  // ignore: sort_constructors_first
  factory PostDTO.fromJson(Map<String, dynamic> json) =>
      _$PostDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PostDTOToJson(this);
}
