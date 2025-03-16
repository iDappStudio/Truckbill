import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:truckbill/core/di/di.dart';
import 'package:truckbill/core/di/get_it.dart';
import 'package:truckbill/firebase_options.dart';
import 'package:truckbill/presentation/router/app_router.dart';
import 'core/theme/app_theme.dart'; // Importujemy AppTheme

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupDependencies();
  runApp(
    HookedBlocConfigProvider(
      injector: () => getIt.get,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'TruckBill App',
      theme: AppTheme.lightTheme, 
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, 
     routerConfig: AppRouter.router, 
    );
  }
}
