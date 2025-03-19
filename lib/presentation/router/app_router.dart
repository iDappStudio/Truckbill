import 'package:go_router/go_router.dart';
import 'package:truckbill/presentation/screens/auth/sign_in.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/login',
    routes: [GoRoute(path: '/login', builder: (context, state) => SignInPage())],
  );
}
