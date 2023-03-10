import 'package:flutter/material.dart';
import 'package:jobsque/core/app_routes.dart';
import 'package:jobsque/screens/splash/provider/splash_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashProvider extends ChangeNotifier {
  SplashState state = SplashState();

  Future<void> init(BuildContext context) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 2)).then((value) {
      //TODO: enable condition
      /* shared.containsKey("onBoard")
          ? Navigator.of(context)
              .pushNamedAndRemoveUntil(AppRoutes.home, (route) => false)
          :  */Navigator.of(context)
              .pushNamedAndRemoveUntil(AppRoutes.onBoard, (route) => false);
    });
  }
}
