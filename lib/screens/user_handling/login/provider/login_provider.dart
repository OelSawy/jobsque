import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/core/app_routes.dart';
import 'package:jobsque/data/models/auth_models/login_response_model.dart';
import 'package:jobsque/data/services/auth_services/login_services.dart';
import 'package:jobsque/screens/home/provider/home_provider.dart';
import 'package:jobsque/screens/user_handling/login/provider/login_state.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  void onEmailChange(String value) {
    value.isEmpty
        ? state.emailErrorMessage = "You must enter a mail"
        : EmailValidator.validate(value)
            ? state.emailErrorMessage = null
            : state.emailErrorMessage = "Enter a valid mail";
    state.email = value;
    notifyListeners();
  }

  void showPassword() {
    state.hidePass == true ? state.hidePass = false : state.hidePass = true;
    notifyListeners();
  }

  bool validate() {
    if (state.passwordErrorMessage == null &&
        state.emailErrorMessage == null &&
        state.password != null &&
        state.email != null) {
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

  Future<void> logIn(BuildContext context) async {
    state.loginResponseModel =
        await LoginServices().login(state.email!, state.password!);
    if (validateLogin()) {
      SharedPreferences shared = await SharedPreferences.getInstance();
      if (state.rememberMe) {
        shared.setBool("loggedIn", true);
        context.read<HomeProvider>().state.profile = (state.loginResponseModel as LoginResponseModelApproved).user;
        shared.setString("profile", loginResponseModelApprovedToJson(state.loginResponseModel as LoginResponseModelApproved));
      }
      shared.setString("token",
          (state.loginResponseModel as LoginResponseModelApproved).token);
      shared.setString(
          "id",
          (state.loginResponseModel as LoginResponseModelApproved)
              .user
              .id
              .toString());
      Navigator.of(context).pushReplacementNamed(AppRoutes.home);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              (state.loginResponseModel as LoginResponseModelDenied).massage)));
    }
  }

  void onChangeRememberMe(bool? value) {
    state.rememberMe = value??false;
    notifyListeners();
  }

  navigateToForgotPawwsord(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.resetPass);
  }

  bool validateLogin() {
    if (state.loginResponseModel.runtimeType == LoginResponseModelApproved) {
      return true;
    } else {
      return false;
    }
  }
}
