import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract class UserDataSource {
  Future<User?> getUser();
  Future<void> updateUser(Map<String, dynamic> data);
  Future<bool> checkIfUserExist(String uid);
}

@singleton
class UserDataSourceImpl extends UserDataSource {
  UserDataSourceImpl({required this.auth, required this.firestore});

  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  @override
  Future<User?> getUser() async {
    return auth.currentUser;
  }

  @override
  Future<void> updateUser(Map<String, dynamic> data) async {
    final user = auth.currentUser;

    if (user != null) {
      await firestore.collection('users').doc(user.uid).update(data);
    } else {
      throw Exception("No logged-in user.");
    }
  }

  @override
  Future<bool> checkIfUserExist(String uid) async {
    final doc = await firestore.collection('users').doc(uid).get();
    return doc.exists;
  }
}
