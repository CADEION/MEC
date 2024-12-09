import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mec_frontend/presentation/screens/auth/login_screen.dart';
import 'package:mec_frontend/presentation/screens/auth/sign_up_screen.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (context) => const LoginScreen());

      case SignUpScreen.routeName:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());

      default:
        return null;
    }
  }
}
