import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:truckbill/data/auth/datasource/apple_data_source.dart';
import 'package:truckbill/data/auth/datasource/email_data_source.dart';
import 'package:truckbill/data/auth/datasource/google_data_source.dart';
import 'package:truckbill/data/user/datasource/user_data_source.dart';
import 'package:truckbill/domain/auth/repository/auth_repository.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(
    this._googleAuthDataSource,
    this._appleAuthDataSource,
    this._emailDataSource,
    this._userDataSource,
  );

  final GoogleAuthDataSource _googleAuthDataSource;
  final AppleAuthDataSource _appleAuthDataSource;
  final UserDataSource _userDataSource;
  final EmailDataSource _emailDataSource;

  @override
  Future<UserCredential> signInWithGoogle() async {
    final userCredential = await _googleAuthDataSource.signInWithGoogle();
     final uid = userCredential.user!.uid;
     final email = userCredential.user!.email ?? "";
    
    final exists = await _userDataSource.checkIfUserExist(uid);
    if (!exists) {
      await _userDataSource.createUser(uid, email);
    }

    return userCredential;
  }


  @override
  Future<UserCredential> signInWithApple() async {
    final userCredential = await _appleAuthDataSource.signInWithApple();
    final uid = userCredential.user!.uid;
    final email = userCredential.user!.email ?? "";

    final exists = await _userDataSource.checkIfUserExist(uid);
    if (!exists) {
      await _userDataSource.createUser(uid, email);
    }

    return userCredential;
  }

  @override
  String get userId {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception("No logged-in user.");
    }
    return user.uid;
  }

  @override
  Future<UserCredential> signUpWithEmail(String email, String password) async {
    final userCredential = await _emailDataSource.signUpWithEmail(email, password);
    final uid = userCredential.user!.uid;

    final exists = await _userDataSource.checkIfUserExist(uid);
    if (!exists) {
      await _userDataSource.createUser(uid, email);
    }

    return userCredential;
  }

  @override
  Future<UserCredential> signInWithEmail(String email, String password) async {
    return await _emailDataSource.signInWithEmail(email, password);
  }
}
