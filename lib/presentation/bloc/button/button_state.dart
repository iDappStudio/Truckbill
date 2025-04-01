import 'package:freezed_annotation/freezed_annotation.dart';

part 'button_state.freezed.dart';

@freezed
class ButtonState with _$ButtonState {
  const factory ButtonState.initial() = ButtonInitialState;
  const factory ButtonState.loading() = ButtonLoadingState;
  const factory ButtonState.loaded() = ButtonLoadedState;
  const factory ButtonState.failure({required String errorMessage}) = ButtonFailureState;
}
