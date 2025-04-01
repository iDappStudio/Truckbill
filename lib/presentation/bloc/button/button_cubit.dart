// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:truckbill/core/usecase/usecase.dart';
import 'package:truckbill/presentation/bloc/button/button_state.dart';

class ButtonCubit extends Cubit<ButtonState> {
  ButtonCubit() : super(const ButtonState.initial());

  Future<void> execute({dynamic params, required UseCase usecase}) async {
    emit(const ButtonState.loading());
    try {
      Either returnedData = await usecase.call(params: params);

      returnedData.fold(
        (error) {
          emit(ButtonState.failure(errorMessage: error.toString()));
        },
        (data) {
          emit(const ButtonState.loaded());
        },
      );
    } catch (e) {
      emit(ButtonState.failure(errorMessage: "Error: ${e.toString()}"));
    }
  }
}
