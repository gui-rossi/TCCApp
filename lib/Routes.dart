import 'package:flutter/material.dart';
import 'package:hello_world/ForgotPassword.dart';

import 'LoginPage.dart';
import 'SignUpPage.dart';
import 'ForgotPassword.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/SignUpPage':
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case '/ForgotPasswordPage':
        return MaterialPageRoute(builder: (_) => ForgotPasswordPage());
      default:
      // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}