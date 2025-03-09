import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:truckbill/data/auth/datasource/auth_data_source.dart';
import 'package:truckbill/domain/auth/repository/auth_repository.dart';

@injectable
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._authDataSource);

  final AuthDataSource _authDataSource;

  @override
  Future<UserCredential> signInWithGoogle() async {
    return _authDataSource.signInWithGoogle();
  }

  @override
  Future<UserCredential> signInWithApple() async {
    return _authDataSource.signInWithApple();
  }
}