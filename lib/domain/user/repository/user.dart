import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository {
  Future<User> getCurrentUser();
  Future<void> updateUser({String? displayName, String? photoURL});
  Future<bool> checkIfUserExists(String uid);
  Future<void> createUser(String uid, String email);
  Future<bool> isLoggedIn();
}
