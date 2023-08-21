import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/core/app_routes.dart';
import 'package:jobsque/data/models/auth_models/register_response_model.dart';
import 'package:jobsque/data/services/auth_services/register_services.dart';
import 'package:jobsque/data/services/profile_services/profile_data_services.dart';
import 'package:jobsque/screens/user_handling/create_account/provider/create_account_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../services/social_auth_services.dart';

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

  Future<void> createAccount(BuildContext context) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setBool("registered", true);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.login, (route) => false);
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

  Future<void> logInWithGoogle(BuildContext context) async {
    // ignore: unused_local_variable
    UserCredential userCredential = await signInWithGoogle();
  }

  Future<void> logInWithFacebook(BuildContext context) async {
    // ignore: unused_local_variable
    UserCredential userCredential = await signInWithFacebook();
  }

  void selectCategory(int index) {
    state.selectedCategories.clear();
    state.selectedCategories.addAll({
      state.categories.keys.elementAt(index):
          state.categories.values.elementAt(index)
    });
    notifyListeners();
  }

  void selectCountry(int index) {
    state.selectedCountries.clear();
    state.selectedCountries.addAll({
      state.countries.keys.elementAt(index):
          state.countries.values.elementAt(index)
    });
    notifyListeners();
  }

  Future<void> register(BuildContext context) async {
    state.registerResponseModel = await RegisterServices()
        .createAccount(state.username!, state.email!, state.password!);
    if (validateResponse() == true) {
      state.registerErrorMessage = null;
      SharedPreferences shared = await SharedPreferences.getInstance();
      shared.setString(
          "id",
          (state.registerResponseModel as RegisterResponseModelApproved)
              .profile
              .id
              .toString());
      shared.setString("token",
          (state.registerResponseModel as RegisterResponseModelApproved).token);
      Navigator.of(context).pushNamed(AppRoutes.categories);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              (state.registerResponseModel as RegisterResponseModelDenied)
                  .massege
                  .email
                  .first)));
    }
  }

  bool validateResponse() {
    if (state.registerResponseModel.runtimeType == RegisterResponseModelApproved) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> profileDone(String type, BuildContext context) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    if (type == "office") {
      state.updateProfileResponseModel = await ProfileDataServices()
          .updateProfile(
              shared.getString("id")!,
              shared.getString("token")!,
              state.selectedCategories.values.first.values.last,
              state.selectedCountries.values.first.values.first,
              "null");
    } else {
      state.updateProfileResponseModel = await ProfileDataServices()
          .updateProfile(
              shared.getString("id")!,
              shared.getString("token")!,
              state.selectedCategories.values.first.values.last,
              "null",
              state.selectedCountries.values.first.values.first);
    }
    if (validateProfileResponse()) {
      state.updateProfileErrorMessage = null;
      Navigator.of(context).pushNamed(AppRoutes.creationSuccessScreen);
    } else {
      state.updateProfileErrorMessage = "Profile Update Error";
    }
  }

  bool validateProfileResponse() {
    return state.updateProfileResponseModel!.status;
  }
}
