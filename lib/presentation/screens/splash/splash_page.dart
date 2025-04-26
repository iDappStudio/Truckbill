import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:truckbill/presentation/router/routes/app_routes.dart';
import 'package:truckbill/presentation/screens/splash/cubit/splash_action.dart';
import 'package:truckbill/presentation/screens/splash/cubit/splash_cubit.dart';

class SplashPage extends HookWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<SplashCubit>();

    useEffect(() {
      cubit.checkIfLoggedIn();
      return null;
    }, []);

    useActionListener<SplashAction>(cubit, (action) {
      switch (action) {
        case SplashAuthenticated():
        //context.go(AppRoutes.home);
        case SplashUnAuthenticated():
          context.go(AppRoutes.login);
      }
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [Icon(Icons.fire_truck, size: 100), SizedBox(height: 20), CircularProgressIndicator()],
        ),
      ),
    );
  }
}
