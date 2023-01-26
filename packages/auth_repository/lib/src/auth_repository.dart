import 'package:auth_repository/src/models/errors.dart';
import 'package:auth_repository/src/models/user.dart' as blog_user;
import 'package:auth_repository/src/utils/extensions.dart';
import 'package:cache_client/cache_client.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  late final FirebaseAuth _firebaseAuth;
  late final CacheClient _cache;

  Future<void> init() async {
    _firebaseAuth = FirebaseAuth.instance;
    _cache = CacheClient();
    await _cache.init();
  }

  Stream<blog_user.User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user =
          firebaseUser == null ? blog_user.User.empty : firebaseUser.toUser;
      _cache.write(user);
      return user;
    });
  }

  blog_user.User get currentUser {
    return _cache.read() ?? blog_user.User.empty;
  }

  Future<void> signUp({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (_) {
      throw const AuthException(message: 'Something went wrong');
    }
  }

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (_) {
      throw const AuthException(message: 'Something went wrong');
    }
  }

  Future<void> logOut() async {
    try {
      await Future.wait<void>([
        _firebaseAuth.signOut(),
      ]);
    } catch (_) {
      throw const AuthException(message: 'Something went wrong');
    }
  }
}
