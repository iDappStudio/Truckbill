import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:truckbill/core/di/di.dart';
import 'package:truckbill/core/di/get_it.dart';
import 'package:truckbill/firebase_options.dart';
import 'package:truckbill/presentation/router/app_router.dart';
import 'package:truckbill/presentation/theme/app_theme.dart';
import 'package:truckbill/presentation/theme/colors/app_colors.dart';
import 'package:truckbill/presentation/theme/colors/dark_app_color.dart';
import 'package:truckbill/presentation/theme/colors/light_app_color.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupDependencies();

  final AppColors appColors = LightColors();
  runApp(HookedBlocConfigProvider(injector: () => getIt.get, child: MyApp(appColors: appColors)));
}

class MyApp extends StatelessWidget {
  final AppColors appColors;

  const MyApp({super.key, required this.appColors});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'TruckBill App',
      theme: AppTheme.getTheme(appColors),
      darkTheme: AppTheme.getTheme(DarkColors()),
      themeMode: ThemeMode.system,
      routerConfig: AppRouter.router,
    );
  }
}
