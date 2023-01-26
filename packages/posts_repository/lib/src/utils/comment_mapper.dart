import 'package:blog_api/blog_api.dart';
import 'package:posts_repository/posts_repository.dart';

extension CommentDTOMapper on CommentDTO {
  Comment toComment() {
    return Comment(
      id: id,
      name: name,
      email: email,
      body: body,
      postId: postId,
    );
  }
}

extension CommentMapper on Comment {
  SendCommentDTO toDTO() {
    return SendCommentDTO(
      postId: postId,
      name: name,
      email: email,
      body: body,
    );
  }
}
