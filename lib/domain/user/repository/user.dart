import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository{
  Future<User?> getUser();
  Future<void> updateUser(Map<String, dynamic> data);
  Future<bool> checkIfUserExist(String uid);
}