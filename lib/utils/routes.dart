import 'package:flutter/material.dart';
import 'package:work_up/view/home_screen.dart';
import '../view/login_screen.dart';
import '../view/register_screen.dart';

class AppRouter {
  static const String loginRoute = '/';
  static const String registerRoute = '/register';
  static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        throw Exception('Rota não encontrada: ${settings.name}');
    }
  }
}