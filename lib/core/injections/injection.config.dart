// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive/hive.dart' as _i979;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:savingsbox_test/core/injections/register_module.dart' as _i620;
import 'package:savingsbox_test/core/network_info/network_info.dart' as _i890;
import 'package:savingsbox_test/features/auth/data/datasources/auth_remote_datasource.dart'
    as _i1062;
import 'package:savingsbox_test/features/auth/data/repositories/auth_repository_impl.dart'
    as _i275;
import 'package:savingsbox_test/features/auth/domain/repositories/auth_repository.dart'
    as _i612;
import 'package:savingsbox_test/features/auth/domain/usecases/get_currentuser_usecase.dart'
    as _i52;
import 'package:savingsbox_test/features/auth/domain/usecases/resetpassword_usecase.dart'
    as _i1050;
import 'package:savingsbox_test/features/auth/domain/usecases/signin_usecase.dart'
    as _i817;
import 'package:savingsbox_test/features/auth/domain/usecases/signout_usecase.dart'
    as _i1037;
import 'package:savingsbox_test/features/auth/domain/usecases/signup_usecase.dart'
    as _i356;
import 'package:savingsbox_test/features/auth/presentation/bloc/auth_bloc.dart'
    as _i784;
import 'package:savingsbox_test/features/task/data/datasources/task_local_datasource.dart'
    as _i587;
import 'package:savingsbox_test/features/task/data/datasources/task_remote_datasource.dart'
    as _i970;
import 'package:savingsbox_test/features/task/data/models/task_model.dart'
    as _i193;
import 'package:savingsbox_test/features/task/data/repositories/task_repository_impl.dart'
    as _i404;
import 'package:savingsbox_test/features/task/domain/repositories/task_repository.dart'
    as _i294;
import 'package:savingsbox_test/features/task/domain/usecases/create_task.dart'
    as _i24;
import 'package:savingsbox_test/features/task/domain/usecases/delete_task.dart'
    as _i727;
import 'package:savingsbox_test/features/task/domain/usecases/get_tasks.dart'
    as _i243;
import 'package:savingsbox_test/features/task/domain/usecases/update_task.dart'
    as _i1066;
import 'package:savingsbox_test/features/task/presentation/bloc/task_bloc.dart'
    as _i44;

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
  gh.factory<_i979.Box<_i193.TaskModel>>(() => registerModule.taskBox);
  gh.factory<_i973.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.factory<_i59.FirebaseAuth>(() => registerModule.firebaseAuth);
  gh.factory<_i974.FirebaseFirestore>(() => registerModule.firebaseFirestore);
  gh.lazySingleton<_i970.TaskRemoteDataSource>(
      () => _i970.TaskRemoteDataSourceImpl(
            gh<_i59.FirebaseAuth>(),
            gh<_i974.FirebaseFirestore>(),
          ));
  gh.lazySingleton<_i890.NetworkInfo>(
      () => _i890.NetworkInfoImpl(gh<_i973.InternetConnectionChecker>()));
  gh.lazySingleton<_i587.TaskLocalDataSource>(
      () => _i587.TaskLocalDataSourceImpl(gh<_i979.Box<_i193.TaskModel>>()));
  gh.lazySingleton<_i1062.AuthRemoteDataSource>(
      () => _i1062.AuthRemoteDataSourceImpl(gh<_i59.FirebaseAuth>()));
  gh.lazySingleton<_i294.TaskRepository>(() => _i404.TaskRepositoryImpl(
        gh<_i970.TaskRemoteDataSource>(),
        gh<_i587.TaskLocalDataSource>(),
      ));
  gh.lazySingleton<_i1066.UpdateTask>(
      () => _i1066.UpdateTask(gh<_i294.TaskRepository>()));
  gh.lazySingleton<_i24.CreateTask>(
      () => _i24.CreateTask(gh<_i294.TaskRepository>()));
  gh.lazySingleton<_i243.GetTasks>(
      () => _i243.GetTasks(gh<_i294.TaskRepository>()));
  gh.lazySingleton<_i727.DeleteTask>(
      () => _i727.DeleteTask(gh<_i294.TaskRepository>()));
  gh.lazySingleton<_i612.AuthRepository>(
      () => _i275.AuthRepositoryImpl(gh<_i1062.AuthRemoteDataSource>()));
  gh.lazySingleton<_i44.TaskBloc>(() => _i44.TaskBloc(
        createTask: gh<_i24.CreateTask>(),
        getTasks: gh<_i243.GetTasks>(),
        updateTask: gh<_i1066.UpdateTask>(),
        deleteTask: gh<_i727.DeleteTask>(),
      ));
  gh.lazySingleton<_i356.SignUpWithEmailAndPassword>(
      () => _i356.SignUpWithEmailAndPassword(gh<_i612.AuthRepository>()));
  gh.lazySingleton<_i52.GetCurrentUser>(
      () => _i52.GetCurrentUser(gh<_i612.AuthRepository>()));
  gh.lazySingleton<_i817.SignInWithEmailAndPassword>(
      () => _i817.SignInWithEmailAndPassword(gh<_i612.AuthRepository>()));
  gh.lazySingleton<_i1050.ResetPassword>(
      () => _i1050.ResetPassword(gh<_i612.AuthRepository>()));
  gh.lazySingleton<_i1037.SignOut>(
      () => _i1037.SignOut(gh<_i612.AuthRepository>()));
  gh.lazySingleton<_i784.AuthBloc>(() => _i784.AuthBloc(
        signInWithEmailAndPassword: gh<_i817.SignInWithEmailAndPassword>(),
        signOut: gh<_i1037.SignOut>(),
        signUpWithEmailAndPassword: gh<_i356.SignUpWithEmailAndPassword>(),
        getCurrentUser: gh<_i52.GetCurrentUser>(),
        resetPassword: gh<_i1050.ResetPassword>(),
      ));
  return getIt;
}

class _$RegisterModule extends _i620.RegisterModule {}
