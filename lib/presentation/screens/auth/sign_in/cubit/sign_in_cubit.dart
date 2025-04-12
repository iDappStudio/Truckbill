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
    dispatch(const SignInAction.showLoading());

    try {
      await authRepository.signInWithGoogle();
      dispatch(const SignInAction.success());
    } on AuthException catch (e) {
      dispatch(SignInAction.showErrorMessage(e.message));
    } catch (e) {
      dispatch(SignInAction.showErrorMessage("Wystąpił błąd podczas logowania"));
    } finally {
      dispatch(const SignInAction.hideLoading());
    }
  }

  Future<void> loginWithApple() async {
    dispatch(const SignInAction.showLoading());

    try {
      await authRepository.signInWithApple();
      dispatch(const SignInAction.success());
    } on AuthException catch (e) {
      dispatch(SignInAction.showErrorMessage(e.message));
    } catch (e) {
      dispatch(SignInAction.showErrorMessage("Wystąpił błąd podczas logowania"));
    } finally {
      dispatch(const SignInAction.hideLoading());
    }
  }

  Future<void> loginWithEmail(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      emit(SignInInitial(errorMessage: 'Please fill in all fields.'));
      return;
    }

    dispatch(const SignInAction.showLoading());

    try {
      await authRepository.signInWithEmail(email, password);
      dispatch(const SignInAction.success());
    } on AuthException catch (e) {
      emit(SignInState.initial(errorMessage: e.message));
    } catch (e) {
      dispatch(SignInAction.showErrorMessage("Wystąpił błąd podczas logowania"));
    } finally {
      dispatch(const SignInAction.hideLoading());
    }
  }
}
