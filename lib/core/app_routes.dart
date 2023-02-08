import 'package:flutter/material.dart';
import 'package:jobsque/screens/home/home_screen.dart';
import 'package:jobsque/screens/on_board/on_board_screen.dart';
import 'package:jobsque/screens/splash/splash_screen.dart';

class AppRoutes {
  static const String splash = "/";
  static const String onBoard = "onBoard";
  static const  String home = "home";

  static Route<dynamic> onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case onBoard:
        return MaterialPageRoute(
          builder: (context) => const OnBoardScreen(),
        );
      case home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text("No route defined for ${setting.name}"),
            ),
          ),
        );
    }
  }
}
