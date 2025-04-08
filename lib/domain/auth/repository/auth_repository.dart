import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<UserCredential> signInWithGoogle();
  Future<UserCredential> signInWithApple();
  String get userId;
  Future<UserCredential> signUpWithEmail(String email, String password);
  Future<UserCredential> signInWithEmail(String email, String password);
  Future<void> resetPassword(String email);
}
