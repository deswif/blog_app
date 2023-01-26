import 'package:blog_api/blog_api.dart';
import 'package:posts_repository/posts_repository.dart';

extension PostDTOMapper on PostDTO {
  Post toPost() {
    return Post(
      id: id,
      title: title,
      body: body,
    );
  }
}

extension PostMapper on Post {
  SendPostDTO toDTO() {
    return SendPostDTO(
      title: title,
      body: body,
    );
  }
}
