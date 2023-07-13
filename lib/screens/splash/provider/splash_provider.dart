import 'package:flutter/material.dart';
import 'package:jobsque/core/app_routes.dart';
import 'package:jobsque/screens/home/provider/home_provider.dart';
import 'package:jobsque/screens/splash/provider/splash_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashProvider extends ChangeNotifier {
  SplashState state = SplashState();

  Future<void> init(BuildContext context) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 2)).then((value) async {
      if (shared.containsKey("onBoard")) {
        if (shared.containsKey("registered")) {
          if (shared.containsKey("loggedIn")) {
            await HomeProvider().init();
            Navigator.pushReplacementNamed(context, AppRoutes.home);
          } else {
            Navigator.pushReplacementNamed(context, AppRoutes.login);
          }
        } else {
          Navigator.pushReplacementNamed(context, AppRoutes.createAccount);
        }
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.onBoard);
      }
    });
  }
}
