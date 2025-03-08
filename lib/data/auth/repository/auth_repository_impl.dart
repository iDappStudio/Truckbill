import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:truckbill/data/auth/datasource/apple_data_source.dart';
import 'package:truckbill/data/auth/datasource/google_data_source.dart';
import 'package:truckbill/domain/auth/repository/auth_repository.dart';

@injectable
class AuthRepositoryImpl implements AuthRepository {
  final GoogleAuthDataSource _googleAuthDataSource;
  final AppleAuthDataSource _appleAuthDataSource;

  AuthRepositoryImpl(this._googleAuthDataSource, this._appleAuthDataSource);

  @override
  Future<UserCredential> signInWithGoogle() async {
    return _googleAuthDataSource.signInWithGoogle();
  }

  @override
  Future<UserCredential> signInWithApple() async {
    return _appleAuthDataSource.signInWithApple();
  }
}