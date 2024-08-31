// lib/main.dart

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savingsbox_test/core/constants/keys.dart';
import 'package:savingsbox_test/core/injections/injection.dart';
import 'package:savingsbox_test/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:toastification/toastification.dart';

import '../core/constants/app_theme.dart';
import '../core/navigators/routes_generator.dart';
import '../core/navigators/routes_manager.dart';
import '../features/task/presentation/bloc/task_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider<AuthBloc>(
        //   create: (context) => AuthBloc(
        //     signInWithEmailAndPassword: sl<SignInWithEmailAndPassword>(),
        //     signOut: sl<SignOut>(),
        //     signUpWithEmailAndPassword: sl<SignUpWithEmailAndPassword>(),
        //     getCurrentUser: sl<GetCurrentUser>(),
        //   ),
        // ),
        BlocProvider<AuthBloc>(create: (context) => sl<AuthBloc>()),
        BlocProvider<TaskBloc>(create: (context) => sl<TaskBloc>()),
      ],
      child: ToastificationWrapper(
        child: MaterialApp(
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          onGenerateRoute: RoutesGenerator.onGenerateRoute,
          initialRoute: RoutesManager.splashRoute,
          navigatorKey: Keys.navigatorKey,
        ),
      ),
    );
  }
}
