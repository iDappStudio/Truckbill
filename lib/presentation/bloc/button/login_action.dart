import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_action.freezed.dart';

@freezed
class LoginAction with _$LoginAction {
  const factory LoginAction.initial() = LoginInitialAction;
  const factory LoginAction.loading() = LoginLoadingAction;
  const factory LoginAction.success() = LoginSuccessAction;
  const factory LoginAction.failure({required String errorMessage}) = LoginFailureAction;
}

