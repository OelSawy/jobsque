import 'package:flutter/material.dart';
import 'package:jobsque/core/app_routes.dart';
import 'package:jobsque/screens/user_handling/login/provider/login_state.dart';

class LoginProvider extends ChangeNotifier {
  LoginState state = LoginState();

  void onPasswordChange(String value) {
    value.isEmpty
        ? state.passwordErrorMessage = "You must enter a password"
        : value.length < 8
            ? state.passwordErrorMessage =
                "Password must be at least 8 characters"
            : state.passwordErrorMessage = null;
    state.password = value;
    notifyListeners();
  }

  void onUsernameChange(String value) {
    value.isEmpty
        ? state.usernameErrorMessage = "You must enter a username"
        : state.usernameErrorMessage = null;
    state.username = value;
    notifyListeners();
  }

  void showPassword() {
    state.hidePass == true ? state.hidePass = false : state.hidePass = true;
    notifyListeners();
  }

  bool validate() {
    if (state.passwordErrorMessage == null &&
        state.usernameErrorMessage == null &&
        state.password != null &&
        state.username != null) {
      return true;
    } else {
      return false;
    }
  }

  logInWithGoogle(BuildContext context) {}

  logInWithFacebook(BuildContext context) {}

  navigateToRegister(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(AppRoutes.createAccount);
  }

  logIn(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
  }

  void onChangeRememberMe(bool? value) {
    state.rememberMe = value!;
    notifyListeners();
  }

  navigateToForgotPawwsord(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.resetPass);
  }
}
