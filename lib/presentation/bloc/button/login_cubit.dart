// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:truckbill/domain/auth/repository/auth_repository.dart';
import 'package:truckbill/presentation/bloc/button/login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepository;

  LoginCubit(this.authRepository) : super(const LoginState.initial());

  Future<void> loginWithGoogle() async {
    emit(const LoginState.loading());
    try {
      await authRepository.signInWithGoogle();
      emit(const LoginState.success());
    } catch (e) {
      emit(LoginState.failure(errorMessage: "Error: \${e.toString()}"));
    }
  }

  Future<void> loginWithApple() async {
    emit(const LoginState.loading());
    try {
      await authRepository.signInWithApple();
      emit(const LoginState.success());
    } catch (e) {
      emit(LoginState.failure(errorMessage: "Error: \${e.toString()}"));
    }
  }

  Future<void> loginWithEmail(String email, String password) async {
    emit(const LoginState.loading());
    try {
      await authRepository.signInWithEmail(email, password);
      emit(const LoginState.success());
    } catch (e) {
      emit(LoginState.failure(errorMessage: "Error: \${e.toString()}"));
    }
  }
}
