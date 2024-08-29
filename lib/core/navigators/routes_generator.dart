import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../features/auth/presentation/view/welcome_view.dart';
import '../../features/auth/presentation/view/signin_view.dart';
import '../../features/auth/presentation/view/signup_view.dart';
import '../../features/auth/presentation/view/splash_view.dart';
import 'routes_manager.dart';
import 'undefined_route.dart';

class RoutesGenerator {
  RoutesGenerator._();
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      //Auth Routes -------------------------------------------------------------------------------------------------------------
      case RoutesManager.splashRoute:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case RoutesManager.welcomeRoute:
        return MaterialPageRoute(builder: (context) => const WelcomeView());
      case RoutesManager.signInRoute:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 300),
          child: const SignInView(),
        );
      case RoutesManager.signUpRoute:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 300),
          child: const SignUpView(),
        );
      //Task Routes -------------------------------------------------------------------------------------------------------------
      // case RoutesManager.tasklistRoute:
      //   return PageTransition(
      //     type: PageTransitionType.rightToLeft,
      //     duration: const Duration(milliseconds: 300),
      //     child: const TaskListView(),
      //   );
      // case RoutesManager.taskDetailRoute:
      //   Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;

      //   return PageTransition(
      //     type: PageTransitionType.rightToLeft,
      //     duration: const Duration(milliseconds: 300),
      //     child: TaskDetailView(
      //       args: args,
      //     ),
      //   );
      // case RoutesManager.taskEditRoute:
      //   Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
      //   return PageTransition(
      //     type: PageTransitionType.rightToLeft,
      //     duration: const Duration(milliseconds: 300),
      //     child: TaskEditView(
      //       args: args,
      //     ),
      //   );
      // case RoutesManager.taskCreateRoute:
      //   return PageTransition(
      //     type: PageTransitionType.rightToLeft,
      //     duration: const Duration(milliseconds: 300),
      //     child: const TaskCreateView(),
      //   );

      //Default Route -------------------------------------------------------------------------------------------------------------
      default:
        return MaterialPageRoute(builder: (context) => const UndefinedRoute());
    }
  }
}
