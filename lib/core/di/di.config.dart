// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:truckbill/data/auth/datasource/apple_data_source.dart' as _i313;
import 'package:truckbill/data/auth/datasource/google_data_source.dart'
    as _i828;
import 'package:truckbill/data/auth/repository/auth_repository_impl.dart'
    as _i907;
import 'package:truckbill/domain/auth/repository/auth_repository.dart' as _i203;
import 'package:truckbill/domain/auth/usecases/sign_in_with_apple.dart'
    as _i497;
import 'package:truckbill/domain/auth/usecases/sign_in_with_google.dart'
    as _i837;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i313.AppleAuthDataSource>(() => _i313.AppleAuthDataSource());
    gh.factory<_i828.GoogleAuthDataSource>(() => _i828.GoogleAuthDataSource());
    gh.factory<_i497.SignInWithApple>(
      () => _i497.SignInWithApple(gh<_i203.AuthRepository>()),
    );
    gh.factory<_i837.SignInWithGoogle>(
      () => _i837.SignInWithGoogle(gh<_i203.AuthRepository>()),
    );
    gh.factory<_i907.AuthRepositoryImpl>(
      () => _i907.AuthRepositoryImpl(
        gh<_i828.GoogleAuthDataSource>(),
        gh<_i313.AppleAuthDataSource>(),
      ),
    );
    return this;
  }
}
