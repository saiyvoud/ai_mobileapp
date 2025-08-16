import 'package:ai_mobile/components/bottom_navigator_widget.dart';
import 'package:ai_mobile/page/auth/login_page.dart';
import 'package:ai_mobile/page/auth/register_page.dart';
import 'package:ai_mobile/page/home_page.dart';
import 'package:flutter/material.dart';

class RouterPath {
  static const String login = "/login";
  static const String register = "/register";
  static const String bottomBar = "/bottomBar";
  static const String home = "/home";

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case register:
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case bottomBar:
        return MaterialPageRoute(builder: (_) => BottomNavigatorWidget());
      case home:
        return MaterialPageRoute(builder: (_) => HomePage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
