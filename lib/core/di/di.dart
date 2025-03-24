import 'package:injectable/injectable.dart';
import 'package:truckbill/core/di/di.config.dart';
import 'package:truckbill/core/di/get_it.dart';

@injectableInit
Future<void> setupDependencies() async => getIt.init();
