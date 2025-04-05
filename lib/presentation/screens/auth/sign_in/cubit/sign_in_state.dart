import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.freezed.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState.initial({String? errorMessage}) = SignInInitial;
  const factory SignInState.loading() = SignInLoading;
}
