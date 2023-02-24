import 'package:flutter/material.dart';
import 'package:jobsque/screens/home/components/job_details/job_deatils.dart';
import 'package:jobsque/screens/home/home_screen.dart';
import 'package:jobsque/screens/on_board/on_board_screen.dart';
import 'package:jobsque/screens/splash/splash_screen.dart';
import 'package:jobsque/screens/user_handling/create_account/components/categories_screen.dart';
import 'package:jobsque/screens/user_handling/create_account/components/countries_screen.dart';
import 'package:jobsque/screens/user_handling/create_account/components/creation_success_screen.dart';
import 'package:jobsque/screens/user_handling/create_account/create_account_screen.dart';
import 'package:jobsque/screens/user_handling/login/login_screen.dart';
import 'package:jobsque/screens/user_handling/reset_password/components/email_sent_screen.dart';
import 'package:jobsque/screens/user_handling/reset_password/components/new_password_screen.dart';
import 'package:jobsque/screens/user_handling/reset_password/reset_password_screen.dart';

import '../screens/user_handling/reset_password/components/reset_success_screen.dart';

class AppRoutes {
  static const String splash = "/";
  static const String onBoard = "onBoard";
  static const String home = "home";

  //! user handling
  static const String createAccount = "createAccount";
  static const String categories = "categories";
  static const String countries = "countries";
  static const String creationSuccessScreen = "creationSuccessScreen";
  static const String login = "login";
  static const String resetPass = "resetPass";
  static const String emailSent = "emailSent";
  static const String chooseNewPass = "chooseNewPass";
  static const String resetSuccessScreen = "resetSuccessScreen";

  //! home
  static const String jobDetails = "jobDetails";

  static Route<dynamic> onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case splash:
        return MaterialPageRoute(
          settings: const RouteSettings(name: "/splash"),
          builder: (context) => const SplashScreen(),
        );
      case onBoard:
        return MaterialPageRoute(
          settings: const RouteSettings(name: "/onBoard"),
          builder: (context) => OnBoardScreen(),
        );
      case home:
        return MaterialPageRoute(
          settings: const RouteSettings(name: "/home"),
          builder: (context) => const HomeScreen(),
        );
      case createAccount:
        return MaterialPageRoute(
          settings: const RouteSettings(name: "/createAccount"),
          builder: (context) => const CreateAccountScreen(),
        );
      case categories:
        return MaterialPageRoute(
          settings: const RouteSettings(name: "/categories"),
          builder: (context) => const CategoriesScreen(),
        );
      case countries:
        return MaterialPageRoute(
          settings: const RouteSettings(name: "/Countries"),
          builder: (context) => const CountriesScreen(),
        );
      case creationSuccessScreen:
        return MaterialPageRoute(
          settings: const RouteSettings(name: "/creationSuccessScreen"),
          builder: (context) => const CreationSuccessScreen(),
        );
      case login:
        return MaterialPageRoute(
          settings: const RouteSettings(name: "/login"),
          builder: (context) => const LoginScreen(),
        );
      case resetPass:
        return MaterialPageRoute(
          settings: const RouteSettings(name: "/resetPass"),
          builder: (context) => const ResetPasswordScreen(),
        );
      case emailSent:
        return MaterialPageRoute(
          settings: const RouteSettings(name: "/emailSent"),
          builder: (context) => const EmailSentScreen(),
        );
      case chooseNewPass:
        return MaterialPageRoute(
          settings: const RouteSettings(name: "/chooseNewPass"),
          builder: (context) => const NewPasswordScreen(),
        );
      case resetSuccessScreen:
        return MaterialPageRoute(
          settings: const RouteSettings(name: "/resetSuccessScreen"),
          builder: (context) => const ResetSuccessScreen(),
        );
      case jobDetails:
        return MaterialPageRoute(
          settings: const RouteSettings(name: "/jobDetails"),
          builder: (context) => JobDeatils(index: setting.arguments as int),
        );
      default:
        return MaterialPageRoute(
          settings: const RouteSettings(name: "/error"),
          builder: (context) => Scaffold(
            body: Center(
              child: Text("No route defined for ${setting.name}"),
            ),
          ),
        );
    }
  }
}
