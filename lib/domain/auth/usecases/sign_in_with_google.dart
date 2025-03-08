import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:truckbill/domain/auth/repository/auth_repository.dart';

@injectable
class SignInWithGoogle {
  final AuthRepository _authRepository;

  SignInWithGoogle(this._authRepository);

  Future<UserCredential> call() async {
    return _authRepository.signInWithGoogle();
  }
}