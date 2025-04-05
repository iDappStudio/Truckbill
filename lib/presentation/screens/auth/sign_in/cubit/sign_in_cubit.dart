// ignore_for_file: depend_on_referenced_packages

import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:truckbill/domain/auth/error/auth_exception.dart';
import 'package:truckbill/domain/auth/repository/auth_repository.dart';
import 'package:truckbill/presentation/screens/auth/sign_in/cubit/sign_in_action.dart';
import 'package:truckbill/presentation/screens/auth/sign_in/cubit/sign_in_state.dart';

@injectable
class SignInCubit extends ActionCubit<SignInState, SignInAction> {
  SignInCubit(this.authRepository) : super(const SignInState.initial());

  final AuthRepository authRepository;

  Future<void> loginWithGoogle() async {
    emit(const SignInState.loading());

    try {
      await authRepository.signInWithGoogle();
      dispatch(const SignInAction.success());
    } on AuthException catch (e) {
      emit(SignInState.initial());
      dispatch(SignInAction.showErrorMessage(e.message));
    } catch (e) {
      emit(SignInState.initial());
      dispatch(SignInAction.showErrorMessage("Wystąpił błąd podczas logowania"));
    }
  }

  Future<void> loginWithApple() async {
    emit(const SignInState.loading());

    try {
      await authRepository.signInWithApple();
      dispatch(const SignInAction.success());
    } on AuthException catch (e) {
      emit(SignInState.initial());
      dispatch(SignInAction.showErrorMessage(e.message));
    } catch (e) {
      emit(SignInState.initial());
      dispatch(SignInAction.showErrorMessage("Wystąpił błąd podczas logowania"));
    }
  }

  Future<void> loginWithEmail(String email, String password) async {
    emit(const SignInState.loading());

    try {
      await authRepository.signInWithEmail(email, password);
      dispatch(const SignInAction.success());
    } on AuthException catch (e) {
      emit(SignInState.initial(errorMessage: e.message));
    } catch (e) {
      emit(SignInState.initial());
      dispatch(SignInAction.showErrorMessage("Wystąpił błąd podczas logowania"));
    }
  }
}
