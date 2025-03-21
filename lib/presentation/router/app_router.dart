import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:truckbill/presentation/screens/auth/sign_in.dart';

part 'app_router.g.dart';

class AppRouter {
  static final router = GoRouter(initialLocation: '/login', routes: $appRoutes);
}

@TypedGoRoute<SignInPageRoute>(path: '/login')
class SignInPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignInPage();
  }
}
