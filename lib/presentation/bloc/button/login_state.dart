import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginInitialState;
  const factory LoginState.loading() = LoginLoadingState;
  const factory LoginState.success() = LoginSuccessState;
  const factory LoginState.failure({required String errorMessage}) = LoginFailureState;
}

