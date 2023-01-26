// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'send_post_dto.g.dart';

@JsonSerializable()
class SendPostDTO {
  SendPostDTO({required this.title, required this.body});

  String title;
  String body;

  // ignore: sort_constructors_first
  factory SendPostDTO.fromJson(Map<String, dynamic> json) =>
      _$SendPostDTOFromJson(json);
  Map<String, dynamic> toJson() => _$SendPostDTOToJson(this);
}
