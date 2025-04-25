import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:truckbill/domain/user/repository/user.dart';
import 'package:truckbill/presentation/screens/splash/cubit/splash_action.dart';
import 'package:truckbill/presentation/screens/splash/cubit/splash_state.dart';

@injectable
class SplashCubit extends ActionCubit<SplashState, SplashAction> {
  SplashCubit(this.userRepository) : super(const SplashState.initial());

  final UserRepository userRepository;

  void checkIfLoggedIn() {
    final isAuthenticated = userRepository.isLoggedIn;
    if (isAuthenticated) {
      dispatch(const SplashAction.authenticated());
    } else {
      dispatch(const SplashAction.unAuthenticated());
    }
  }
}
