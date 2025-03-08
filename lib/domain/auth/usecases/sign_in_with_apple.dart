import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:truckbill/domain/auth/repository/auth_repository.dart';

@injectable
class SignInWithApple {
  final AuthRepository _authRepository;

  SignInWithApple(this._authRepository);

  Future<UserCredential> call() async {
    return _authRepository.signInWithApple();
  }
}
