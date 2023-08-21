import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jobsque/core/app_routes.dart';
import 'package:jobsque/screens/splash/provider/splash_state.dart';
import 'package:jobsque/services/local_auth_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashProvider extends ChangeNotifier {
  SplashState state = SplashState();

  Future<void> init(BuildContext context) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    // shared.clear();
    await Future.delayed(const Duration(seconds: 2)).then((value) async {
      if (shared.containsKey("onBoard")) {
        if (shared.containsKey("loggedIn")) {
          if (shared.containsKey("faceID")) {
            if (shared.getBool("faceID") == true) {
              if (await LocalAuth.authenticate()) {
                Navigator.pushReplacementNamed(context, AppRoutes.home);
              } else {
                exit(0);
              }
            }
          } else {
            
                Navigator.pushReplacementNamed(context, AppRoutes.home);
          }
        } else {
          if (shared.containsKey("registered")) {
            Navigator.pushReplacementNamed(context, AppRoutes.login);
          } else {
            Navigator.pushReplacementNamed(context, AppRoutes.createAccount);
          }
        }
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.onBoard);
      }
    });
  }
}
