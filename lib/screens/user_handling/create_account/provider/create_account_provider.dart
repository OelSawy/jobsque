
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/core/app_routes.dart';
import 'package:jobsque/screens/user_handling/create_account/provider/create_account_state.dart';

class CreateAccountProvider extends ChangeNotifier {
  CreateAccountState state = CreateAccountState();

  void onEmailChange(String value) {
    value.isEmpty
        ? state.emailErrorMessage = "You must enter a mail"
        : EmailValidator.validate(value)
            ? state.emailErrorMessage = null
            : state.emailErrorMessage = "Enter a valid mail";
    state.email = value;
    notifyListeners();
  }

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

  navigateToLogin(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(AppRoutes.login);
  }

  createAccount(BuildContext context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
  }

  bool validate() {
    if (state.emailErrorMessage == null &&
        state.passwordErrorMessage == null &&
        state.usernameErrorMessage == null &&
        state.email != null &&
        state.password != null &&
        state.username != null) {
      return true;
    } else {
      return false;
    }
  }

  signInWithGoogle(BuildContext context) {}

  signInWithFacebook(BuildContext context) {}

  void selectCategory(int index) {
    if (!state.selectedCategories
        .containsValue(state.categories.values.elementAt(index))) {
      state.selectedCategories.addAll({
        state.categories.keys.elementAt(index):
            state.categories.values.elementAt(index)
      });
    } else {
      state.selectedCategories.remove(state.selectedCategories.keys.elementAt(index));
    }
    notifyListeners();
  }

  void selectCountry(int index) {
    if (!state.selectedCountries
        .containsValue(state.countries.values.elementAt(index))) {
      state.selectedCountries.addAll({
        state.countries.keys.elementAt(index):
            state.countries.values.elementAt(index)
      });
    } else {
      state.selectedCountries.remove(state.selectedCountries.keys.elementAt(index));
    }
    notifyListeners();
  }
}
