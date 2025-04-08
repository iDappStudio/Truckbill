import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:truckbill/presentation/router/routes/app_routes.dart';
import 'package:truckbill/presentation/screens/auth/forgot_password/forgot_password.dart';
import 'package:truckbill/presentation/screens/auth/sign_in/sign_in.dart';
import 'package:truckbill/presentation/screens/auth/sign_up/sign_up.dart';

part 'app_router.g.dart';

class AppRouter {
  static final router = GoRouter(initialLocation: AppRoutes.login, routes: $appRoutes);
}

@TypedGoRoute<SignInRoute>(path: AppRoutes.login)
class SignInRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignInPage();
  }
}

@TypedGoRoute<SignUpRoute>(path: AppRoutes.createAccount)
class SignUpRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignUpPage();
  }
}

@TypedGoRoute<ForgotPasswordRoute>(path: AppRoutes.forgotPassword)
class ForgotPasswordRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ForgotPasswordPage();
  }
}
