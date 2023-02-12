import 'package:flutter/material.dart';
import 'package:jobsque/screens/home/home_screen.dart';
import 'package:jobsque/screens/on_board/on_board_screen.dart';
import 'package:jobsque/screens/splash/splash_screen.dart';
import 'package:jobsque/screens/user_handling/create_account/components/categories_screen.dart';
import 'package:jobsque/screens/user_handling/create_account/components/countries_screen.dart';
import 'package:jobsque/screens/user_handling/create_account/components/success_screen.dart';
import 'package:jobsque/screens/user_handling/create_account/create_account_screen.dart';

class AppRoutes {
  static const String splash = "/";
  static const String onBoard = "onBoard";
  static const String home = "home";
  static const String createAccount = "createAccount";
  static const String categories = "categories";
  static const String countries = "countries";
  static const String successScreen = "successScreen";

  static Route<dynamic> onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case onBoard:
        return MaterialPageRoute(
          builder: (context) => OnBoardScreen(),
        );
      case home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case createAccount:
        return MaterialPageRoute(
          builder: (context) => const CreateAccountScreen(),
        );
      case categories:
        return MaterialPageRoute(
          builder: (context) => const CategoriesScreen(),
        );
      case countries:
        return MaterialPageRoute(
          builder: (context) => const CountriesScreen(),
        );
      case successScreen:
        return MaterialPageRoute(
          builder: (context) => const SuccessScreen(),
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
