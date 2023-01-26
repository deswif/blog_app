// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_comment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendCommentDTO _$SendCommentDTOFromJson(Map<String, dynamic> json) =>
    SendCommentDTO(
      postId: json['postId'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$SendCommentDTOToJson(SendCommentDTO instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'name': instance.name,
      'email': instance.email,
      'body': instance.body,
    };
