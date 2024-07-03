import 'package:doc_doc/core/routing/routes.dart';
import 'package:doc_doc/features/on_boarding/presentation/screens/on_boarding_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingView(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(),
        );
    }
  }
}
