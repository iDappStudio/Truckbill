import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:truckbill/presentation/router/routes/app_routes.dart';
import 'package:truckbill/presentation/screens/auth/sign_in.dart';
import 'package:truckbill/presentation/screens/auth/sign_up.dart';

part 'app_router.g.dart';

class AppRouter {
  static final router = GoRouter(initialLocation: AppRoutes.login, routes: $appRoutes);
}

@TypedGoRoute<SignInRoute>(path: AppRoutes.login)
class SignInRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignIn();
  }
}

@TypedGoRoute<SignUpRoute>(path: AppRoutes.createAccount)
class SignUpRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignUp();
  }
}