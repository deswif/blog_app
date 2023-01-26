import 'package:auth_repository/src/models/user.dart' as blog_user;
// ignore: depend_on_referenced_packages
import 'package:characters/characters.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension UserX on User {
  blog_user.User get toUser {
    return blog_user.User(
      id: uid,
      name: displayName ?? 'user_$uid'.characters.take(20).string,
      email: email,
    );
  }
}
