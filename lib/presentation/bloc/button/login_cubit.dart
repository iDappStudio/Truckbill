// ignore_for_file: depend_on_referenced_packages

import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:truckbill/domain/auth/repository/auth_repository.dart';
import 'package:truckbill/presentation/bloc/button/login_action.dart';
import 'package:truckbill/presentation/bloc/button/login_state.dart';

@injectable
class LoginCubit extends ActionCubit<LoginState, LoginAction> {
  final AuthRepository authRepository;

  LoginCubit(this.authRepository) : super(const LoginState.initial());

  Future<void> loginWithGoogle() async {
    emit(const LoginState.loading());
    try {
      await authRepository.signInWithGoogle();
      emit(const LoginState.success());
      dispatch(const LoginAction.success());
    } catch (e) {
      dispatch(LoginAction.failure(errorMessage: "Error: ${e.toString()}"));
    }
  }

  Future<void> loginWithApple() async {
    emit(const LoginState.loading());
    try {
      await authRepository.signInWithApple();
      emit(const LoginState.success());
      dispatch(const LoginAction.success());
    } catch (e) {
      dispatch(LoginAction.failure(errorMessage: "Error: ${e.toString()}"));
    }
  }

  Future<void> loginWithEmail(String email, String password) async {
    emit(const LoginState.loading());
    try {
      await authRepository.signInWithEmail(email, password);
      emit(const LoginState.success());
      dispatch(const LoginAction.success());
    } catch (e) {
      dispatch(LoginAction.failure(errorMessage: "Error: ${e.toString()}"));
    }
  }
}
