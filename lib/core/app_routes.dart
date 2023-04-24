import 'package:flutter/material.dart';
import 'package:jobsque/screens/home/home_screen.dart';
import 'package:jobsque/screens/home/items/profile/components/edit_profile.dart';
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

import '../screens/home/components/home_notifications.dart';
import '../screens/home/items/profile/components/login_and_security.dart';
import '../screens/home/items/profile/components/notification.dart';
import '../screens/home/items/profile/components/portfolio.dart';
import '../screens/job_details_and_application/components/job_application/job_application_biodata.dart';
import '../screens/job_details_and_application/components/job_application/job_application_portfolio.dart';
import '../screens/job_details_and_application/components/job_application/job_application_successful.dart';
import '../screens/job_details_and_application/components/job_application/job_application_type.dart';
import '../screens/job_details_and_application/job_deatils_screen.dart';
import '../screens/user_handling/reset_password/components/reset_success_screen.dart';

class AppRoutes {
  static const String splash = "/";
  static const String onBoard = "onBoard";

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
  static const String home = "home";
  static const String notificationsScreen = "notificationsScreen";

  //! job deatails and application
  static const String jobDetails = "jobDetails";
  static const String applicationBiodata = "applicationBiodata";
  static const String applicationType = "applicationType";
  static const String applicationPortfolio = "applicationPortfolio";
  static const String applicationSuccessful = "JobApplicationSuccessful";

  //! profile
  static const String editProfile = "editProfile";
  static const String portfolio = "portfolio";
  static const String profileNotification = "profileNotification";
  static const String loginAndSecurity = "loginAndSecurity";

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
      case applicationBiodata:
        return MaterialPageRoute(
          settings: const RouteSettings(name: "/applicationBiodata"),
          builder: (context) => const JobApplicationBiodata(),
        );
      case applicationType:
        return MaterialPageRoute(
          settings: const RouteSettings(name: "/applicationType"),
          builder: (context) => const JobApplicationType(),
        );
      case applicationPortfolio:
        return MaterialPageRoute(
          settings: const RouteSettings(name: "/applicationPortfolio"),
          builder: (context) => const JobApplicationPortfolio(),
        );
      case applicationSuccessful:
        return MaterialPageRoute(
          settings: const RouteSettings(name: "/applicationSuccessful"),
          builder: (context) => const JobApplicationSuccessful(),
        );
      case notificationsScreen:
        return MaterialPageRoute(
          settings: const RouteSettings(name: "/notificationsScreen"),
          builder: (context) => const NotificationsScreen(),
        );
      case editProfile:
        return MaterialPageRoute(
          settings: const RouteSettings(name: "/editProfile"),
          builder: (context) => const EditProfile(),
        );
      case portfolio:
        return MaterialPageRoute(
          settings: const RouteSettings(name: "/portfolio"),
          builder: (context) => const Portfolio(),
        );
      case profileNotification :
        return MaterialPageRoute(
          settings: const RouteSettings(name: "/profileNotification"),
          builder: (context) => const ProfileNotification()
        );
      case loginAndSecurity :
        return MaterialPageRoute(
          settings: const RouteSettings(name: "/loginAndSecurity"),
          builder: (context) => const LoginAndSecurity()
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
