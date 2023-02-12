import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/screens/user_handling/reset_password/provider/reset_password_state.dart';

import '../../../../core/app_routes.dart';

class ResetPasswordProvider extends ChangeNotifier {
  ResetPasswordState state = ResetPasswordState();

  void onEmailChange(String value) {
    value.isEmpty
        ? state.emailErrorMessage = "You must enter a mail"
        : EmailValidator.validate(value)
            ? state.emailErrorMessage = null
            : state.emailErrorMessage = "Enter a valid mail";
    state.email = value;
    notifyListeners();
  }

  void navigateToLogin(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(AppRoutes.login);
  }

  void navigateToLoginAfterReset(BuildContext context) {
    Navigator.popUntil(context, ModalRoute.withName("/login"));
  }

  bool validate() {
    if (state.emailErrorMessage == null && state.email != null) {
      return true;
    } else {
      return false;
    }
  }

  sendEmail(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.emailSent);
  }

  openEmailApp(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.chooseNewPass);
  }

  void showNewPassword() {
    state.hideNewPass == true ? state.hideNewPass = false : state.hideNewPass = true;
    notifyListeners();
  }

  void showConfirmNewPassword() {
    state.hideConfirmNewPass == true ? state.hideConfirmNewPass = false : state.hideConfirmNewPass = true;
    notifyListeners();
  }

  bool validateNewPass() {
    if (state.newPassErrorMessage == null &&
        state.newPass != null &&
        state.confirmNewPassErrorMessage == null &&
        state.confirmNewPass != null) {
      return true;
    } else {
      return false;
    }
  }

  void onNewPasswordChange(String value) {
    value.isEmpty
        ? state.newPassErrorMessage = "You must enter a password"
        : value.length < 8
            ? state.newPassErrorMessage =
                "Password must be at least 8 characters"
            : state.newPassErrorMessage = null;
    state.newPass = value;
    notifyListeners();
  }

  void onConfirmNewPasswordChange(String value) {
    value.isEmpty
        ? state.confirmNewPassErrorMessage = "You must enter a password"
        : value.length < 8
            ? state.confirmNewPassErrorMessage =
                "Password must be at least 8 characters"
            : value.compareTo(state.newPass!) == 0
                ? state.confirmNewPassErrorMessage = null
                : state.confirmNewPassErrorMessage = "Passwords don't match";
    state.confirmNewPass = value;
    notifyListeners();
  }

  successScreen(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.resetSuccessScreen);
  }
}
