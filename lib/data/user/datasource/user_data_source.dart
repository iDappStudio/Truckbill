import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@singleton
class UserDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User> getCurrentUser() async {
    final user = _auth.currentUser;
    if (user == null) {
      throw Exception("No logged-in user.");
    }
    return user;
  }

  Future<void> updateUser({String? displayName, String? photoURL}) async {
    final user = await getCurrentUser();

    try {
      await user.updateProfile(displayName: displayName ?? user.displayName, photoURL: photoURL ?? user.photoURL);
      await user.reload();
    } catch (e) {
      throw Exception("Failed to update user data");
    }
  }

  Future<bool> checkIfUserExists(String uid) async {
    final doc = await _firestore.collection('users').doc(uid).get();
    return doc.exists;
  }

  Future<void> createUser(String uid, String email) async {
    await _firestore.collection('users').doc(uid).set({'email': email});
  }

  bool get isLoggedIn => _auth.currentUser != null;
}
