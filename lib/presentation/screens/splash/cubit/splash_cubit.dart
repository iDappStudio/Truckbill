import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:truckbill/domain/user/repository/user.dart';
import 'package:truckbill/presentation/screens/splash/cubit/splash_action.dart';
import 'package:truckbill/presentation/screens/splash/cubit/splash_state.dart';

@injectable
class SplashCubit extends ActionCubit<SplashState, SplashAction> {
  SplashCubit(this.userRepository) : super(SplashState.initial());

  final UserRepository userRepository;

  Future<bool> isLoggedIn() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      bool isAuthenticated = await userRepository.isLoggedIn();
      if (isAuthenticated) {
        dispatch(const SplashAction.authenticated());
      } else {
        dispatch(const SplashAction.unAuthenticated());
      }
      return isAuthenticated;
    } catch (e) {
      dispatch(const SplashAction.unAuthenticated());
      return false;
    }
  }
}
