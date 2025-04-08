import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:truckbill/domain/auth/error/auth_exception.dart';
import 'package:truckbill/domain/auth/repository/auth_repository.dart';
import 'package:truckbill/presentation/screens/auth/sign_up/cubit/sign_up_action.dart';
import 'package:truckbill/presentation/screens/auth/sign_up/cubit/sign_up_state.dart';

class SignUpCubit extends ActionCubit<SignUpState, SignUpAction> {
  SignUpCubit(this.authRepository) : super(const SignUpState.initial());

  final AuthRepository authRepository;

  Future<void> signUpWithEmail(String email, String password, String confirmPassword) async {

    if (password != confirmPassword) {
      emit(SignUpInitial(errorMessage: 'Hasła nie są identyczne'));
      return;
    }

    dispatch(const SignUpAction.showLoading());
    try{
      await authRepository.signUpWithEmail(email, password);
      dispatch(const SignUpAction.success());
    } on AuthException catch (e) {
      emit(SignUpInitial(errorMessage: e.message));
    } catch (e) {
      dispatch(SignUpAction.showErrorMessage('Wystąpił błąd podczas próby rejestracji'));
    } finally {
      dispatch(SignUpAction.hideLoading());
    }
  }
}