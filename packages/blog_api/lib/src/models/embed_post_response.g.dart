// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'embed_post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmbedPostResponse _$EmbedPostResponseFromJson(Map<String, dynamic> json) =>
    EmbedPostResponse(
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
      comments: (json['comments'] as List<dynamic>)
          .map((e) => CommentDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EmbedPostResponseToJson(EmbedPostResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'comments': instance.comments,
    };
