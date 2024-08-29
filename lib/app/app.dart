// lib/main.dart

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: const [
        // BlocProvider<AuthBloc>(create: (context) => getIt<AuthBloc>()),
        // BlocProvider<TaskBloc>(create: (context) => getIt<TaskBloc>()),
      ],
      child: DevicePreview(
        enabled: kReleaseMode,
        builder: (context) {
          return ToastificationWrapper(
            child: MaterialApp(
              locale: DevicePreview.locale(context),
              builder: DevicePreview.appBuilder,
              debugShowCheckedModeBanner: false,
              themeMode: ThemeMode.light,
              // theme: Themes.lightTheme,
              // darkTheme: Themes.darkTheme,
              // onGenerateRoute: RoutesGenerator.onGenerateRoute,
              // initialRoute: RoutesManager.splashRoute,
              // navigatorKey: Helpers.navigatorKey,
            ),
          );
        },
      ),
    );
  }
}
