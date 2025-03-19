import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:truckbill/core/di/get_it.dart';

@injectableInit
Future<void> setupDependencies() async {
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance); 
}