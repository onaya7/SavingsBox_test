// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive/hive.dart' as _i979;
import 'package:hive_flutter/hive_flutter.dart' as _i986;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:savingsbox_test/core/injections/register_module.dart' as _i620;
import 'package:savingsbox_test/core/local_data/local_data_storage.dart'
    as _i853;
import 'package:savingsbox_test/core/network_info/network_info.dart' as _i890;
import 'package:savingsbox_test/features/auth/data/datasources/auth_remote_datasource.dart'
    as _i1062;
import 'package:savingsbox_test/features/auth/data/repositories/auth_repository_impl.dart'
    as _i275;
import 'package:savingsbox_test/features/auth/domain/repositories/auth_repository.dart'
    as _i612;
import 'package:savingsbox_test/features/auth/domain/usecases/get_currentuser_usecase.dart'
    as _i52;
import 'package:savingsbox_test/features/auth/domain/usecases/signin_usecase.dart'
    as _i817;
import 'package:savingsbox_test/features/auth/domain/usecases/signout_usecase.dart'
    as _i1037;
import 'package:savingsbox_test/features/auth/domain/usecases/signup_usecase.dart'
    as _i356;
import 'package:savingsbox_test/features/auth/presentation/bloc/auth_bloc.dart'
    as _i784;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.factory<_i986.Box<dynamic>>(() => registerModule.box);
  gh.factory<_i973.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.factory<_i59.FirebaseAuth>(() => registerModule.firebaseAuth);
  gh.lazySingleton<_i890.NetworkInfo>(
      () => _i890.NetworkInfoImpl(gh<_i973.InternetConnectionChecker>()));
  gh.lazySingleton<_i853.LocalDataStorage>(
      () => _i853.LocalDataStorageImpl(gh<_i979.Box<dynamic>>()));
  gh.lazySingleton<_i1062.AuthRemoteDataSource>(
      () => _i1062.AuthRemoteDataSourceImpl(gh<_i59.FirebaseAuth>()));
  gh.lazySingleton<_i612.AuthRepository>(
      () => _i275.AuthRepositoryImpl(gh<_i1062.AuthRemoteDataSource>()));
  gh.lazySingleton<_i356.SignUpWithEmailAndPassword>(
      () => _i356.SignUpWithEmailAndPassword(gh<_i612.AuthRepository>()));
  gh.lazySingleton<_i52.GetCurrentUser>(
      () => _i52.GetCurrentUser(gh<_i612.AuthRepository>()));
  gh.lazySingleton<_i817.SignInWithEmailAndPassword>(
      () => _i817.SignInWithEmailAndPassword(gh<_i612.AuthRepository>()));
  gh.lazySingleton<_i1037.SignOut>(
      () => _i1037.SignOut(gh<_i612.AuthRepository>()));
  gh.lazySingleton<_i784.AuthBloc>(() => _i784.AuthBloc(
        signInWithEmailAndPassword: gh<_i817.SignInWithEmailAndPassword>(),
        signOut: gh<_i1037.SignOut>(),
        signUpWithEmailAndPassword: gh<_i356.SignUpWithEmailAndPassword>(),
        getCurrentUser: gh<_i52.GetCurrentUser>(),
      ));
  return getIt;
}

class _$RegisterModule extends _i620.RegisterModule {}
