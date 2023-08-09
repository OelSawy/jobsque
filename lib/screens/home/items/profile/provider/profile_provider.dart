import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/core/enums.dart';
import 'package:jobsque/data/models/auth_models/login_response_model.dart';
import 'package:jobsque/data/models/portfolio_models/get_portfolio_response_model.dart';
import 'package:jobsque/data/services/auth_services/login_services.dart';
import 'package:jobsque/data/services/auth_services/profile_services.dart';
import 'package:jobsque/data/services/profile_services/portfolio_services.dart';
import 'package:jobsque/data/services/profile_services/profile_data_services.dart';
import 'package:jobsque/screens/home/items/profile/provider/profile_state.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';

class ProfileProvider extends ChangeNotifier {
  ProfileState state = ProfileState();

  void onNameChange(String value) {
    value.isEmpty
        ? state.nameErrorMessage = "Name is required"
        : state.nameErrorMessage = null;
    state.name = value;
    notifyListeners();
  }

  void onBioChange(String value) {
    value.isEmpty
        ? state.bioErrorMessage = "Bio is required"
        : state.bioErrorMessage = null;
    state.bio = value;
    notifyListeners();
  }

  void onAddressChange(String value) {
    value.isEmpty
        ? state.addressErrorMessage = "Address is required"
        : state.addressErrorMessage = null;
    state.address = value;
    notifyListeners();
  }

  void onPhoneChange(PhoneNumber value) {
    value.phoneNumber == value.dialCode
        ? state.phoneErrorMessgae = "Phone is required"
        : state.phoneErrorMessgae = null;
    state.phone = value;
    notifyListeners();
  }

  void onOldPassChange(String value) {
    value.isEmpty
        ? state.oldPassErrorMessage = "You must enter a password"
        : value.contains(" ")
            ? state.oldPassErrorMessage = "Password must not contain spaces"
            : value.length < 8
                ? state.oldPassErrorMessage =
                    "Password must be at least 8 characters"
                : state.oldPassErrorMessage = null;
    state.oldPass = value;
    notifyListeners();
  }

  void onNewPassChange(String value) {
    value.isEmpty
        ? state.newPassErrorMessage = "You must enter a password"
        : value.contains(" ")
            ? state.newPassErrorMessage = "Password must not contain spaces"
            : value.length < 8
                ? state.newPassErrorMessage =
                    "Password must be at least 8 characters"
                : state.newPassErrorMessage = null;
    state.newPass = value;
    notifyListeners();
  }

  void onConfirmNewPassChange(String value) {
    value.isEmpty
        ? state.confirmNewPassErrorMessage = "You must enter a password"
        : value.contains(" ")
            ? state.confirmNewPassErrorMessage =
                "Password must not contain spaces"
            : value.length < 8
                ? state.confirmNewPassErrorMessage =
                    "Password must be at least 8 characters"
                : state.confirmNewPassErrorMessage = null;
    state.confirmNewPass = value;
    notifyListeners();
  }

  void showOldPass() {
    state.hideOldPass = !state.hideOldPass;
    notifyListeners();
  }

  void showNewPass() {
    state.hideNewPass = !state.hideNewPass;
    notifyListeners();
  }

  void showConfirmNewPassword() {
    state.hideConfirmNewPass = !state.hideConfirmNewPass;
    notifyListeners();
  }

  validate() {
    return state.name != null &&
        state.bio != null &&
        state.address != null &&
        state.nameErrorMessage == null &&
        state.bioErrorMessage == null &&
        state.addressErrorMessage == null;
  }

  void onEmailChange(String value) {
    value.isEmpty
        ? state.emailErrorMessage = "You must enter an e-mail"
        : EmailValidator.validate(value)
            ? state.emailErrorMessage = null
            : state.emailErrorMessage = "Enter a valid e-mail";
    state.email = value;
    notifyListeners();
  }

  Future<void> saveProfile(BuildContext context) async {
    state.detailsLoadingState = LoadingState.loading;
    notifyListeners();
    SharedPreferences shared = await SharedPreferences.getInstance();
    await ProfileDataServices().editBioAndData(shared.getString("id")!,
        shared.getString("token")!, state.bio!, state.address!, "0121212120");
    await ProfileServices().updateName(
        shared.getString("id")!, shared.getString("token")!, state.name!);
    state.bioController.clear();
    state.addressController.clear();
    state.nameController.clear();
    state.name = null;
    state.bio = null;
    state.address = null;
    state.detailsLoadingState = LoadingState.done;
    notifyListeners();
    Navigator.of(context).pop();
  }

  void jobSearchAlertChange(bool value) {
    state.jobSearchAlert = value;
    notifyListeners();
  }

  void jobApplicationUpdateChange(bool value) {
    state.jobApplicationUpdate = value;
    notifyListeners();
  }

  void jobApplicationRemindersChange(bool value) {
    state.jobApplicationReminders = value;
    notifyListeners();
  }

  void interestedInJobsChange(bool value) {
    state.interestedInJobs = value;
    notifyListeners();
  }

  void jobSeekerUpdatesChange(bool value) {
    state.jobSeekerUpdates = value;
    notifyListeners();
  }

  void showProfileChange(bool value) {
    state.showProfile = value;
    notifyListeners();
  }

  void allMessagesChange(bool value) {
    state.allMessages = value;
    notifyListeners();
  }

  void messageNudgesChange(bool value) {
    state.messageNudges = value;
    notifyListeners();
  }

  bool checkEmail() {
    return state.email != null && state.emailErrorMessage == null;
  }

  void saveEmail(BuildContext context) {
    Navigator.of(context).pop();
  }

  void phoneToResetPassChange(bool value) {
    state.phoneToResetPass = value;
    notifyListeners();
  }

  bool checkPhone() {
    return state.phone != null && state.phoneErrorMessgae == null;
  }

  void savePhone(BuildContext context) {
    Navigator.of(context).pop();
  }

  bool checkPasswords() {
    return state.oldPass != null &&
        state.newPass != null &&
        state.confirmNewPass != null &&
        state.oldPassErrorMessage == null &&
        state.newPassErrorMessage == null &&
        state.confirmNewPassErrorMessage == null;
  }

  Future<void> changePassword(BuildContext context) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    if (checkPasswords()) {
      if ((await LoginServices().login(
                  loginResponseModelApprovedFromJson(
                          shared.getString("profile")!)
                      .user
                      .email,
                  state.oldPass!))
              .runtimeType ==
          LoginResponseModelDenied) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Old password is incorrect")));
      } else {
        if (state.newPass == state.confirmNewPass) {
          if (state.newPass == state.oldPass) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content:
                    Text("New password can't be the same as old password")));
          } else {
            await ProfileServices().updatePassword(shared.getString("id")!,
                shared.getString("token")!, state.newPass!);
            Navigator.of(context).pop();
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Passwords don't match")));
        }
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please fill all fields correctly")));
    }
  }

  void twoFactorAuthenticationChange(bool value) {
    state.isTwoFactorAuthEnabled = value;
    notifyListeners();
  }

  void verificationMethodChange(Object? value) {
    state.verificationMethod = value as VerificationMethod;
    notifyListeners();
  }

  void onPhoneVerificationChange(PhoneNumber value) {
    value.phoneNumber == value.dialCode
        ? state.phoneVerificationErrorMessgae = "Phone is required"
        : state.phoneVerificationErrorMessgae = null;
    state.phoneVerification = value;
    notifyListeners();
  }

  void onPhoneVerificationPassChange(String value) {
    value.isEmpty
        ? state.phoneVerificationPassErrorMessage = "You must enter a password"
        : value.contains(" ")
            ? state.phoneVerificationPassErrorMessage =
                "Password must not contain spaces"
            : value.length < 8
                ? state.phoneVerificationPassErrorMessage =
                    "Password must be at least 8 characters"
                : state.phoneVerificationPassErrorMessage = null;
    state.phoneVerificationPass = value;
    notifyListeners();
  }

  void showPhoneVerificationPass() {
    state.hidePhoneVerificationPass = !state.hidePhoneVerificationPass;
    notifyListeners();
  }

  bool verifyPhoneVerification() {
    return state.phoneVerification != null &&
        state.phoneVerificationErrorMessgae == null &&
        state.phoneVerificationPass != null &&
        state.phoneVerificationPassErrorMessage == null;
  }

  void code1Change(String value) {
    value.length == 1 ? state.code1 = value : state.code1 = null;
    notifyListeners();
  }

  void code2Change(String value) {
    value.length == 1 ? state.code2 = value : state.code2 = null;
    notifyListeners();
  }

  void code3Change(String value) {
    value.length == 1 ? state.code3 = value : state.code3 = null;
    notifyListeners();
  }

  void code4Change(String value) {
    value.length == 1 ? state.code4 = value : state.code4 = null;
    notifyListeners();
  }

  void code5Change(String value) {
    value.length == 1 ? state.code5 = value : state.code5 = null;
    notifyListeners();
  }

  void code6Change(String value) {
    value.length == 1 ? state.code6 = value : state.code6 = null;
    notifyListeners();
  }

  Future<void> loadPorfolios() async {
    state.portfolioLoadingState = LoadingState.loading;
    notifyListeners();
    SharedPreferences shared = await SharedPreferences.getInstance();
    GetPorfolioResponseModel getPorfolioResponseModel =
        await PortfolioServices()
            .getPortfolio(shared.getString("id")!, shared.getString("token")!);
    state.portfolios = getPorfolioResponseModel.data;
    state.portfolioLoadingState = LoadingState.done;
    notifyListeners();
  }

  void onPortfolioNameChange(String value) {
    value.isEmpty
        ? state.portfoioNameErrorMessage = "Portfolio name is required"
        : state.portfoioNameErrorMessage = null;
    state.portfolioName = value;
    notifyListeners();
  }

  validatePortfolioName() {
    return state.portfolioName != null &&
        state.portfoioNameErrorMessage == null;
  }

  Future<void> updatePortfolio(int index) async {
    state.portfolioLoadingState = LoadingState.loading;
    notifyListeners();
    SharedPreferences shared = await SharedPreferences.getInstance();
    await PortfolioServices().editPortfolio(
        state.portfolioName!,
        state.portfolios[index].cvFile,
        shared.getString("id")!,
        shared.getString("token")!);
    loadPorfolios();
    state.portfolioLoadingState = LoadingState.done;
    notifyListeners();
  }

  Future<void> deletePortfolio() async {
    state.portfolioLoadingState = LoadingState.loading;
    notifyListeners();
    SharedPreferences shared = await SharedPreferences.getInstance();
    await PortfolioServices()
        .deletePortfolio(shared.getString("id")!, shared.getString("token")!);
    loadPorfolios();
    state.portfolioLoadingState = LoadingState.done;
    notifyListeners();
  }

  Future<void> addPortfolio() async {
    state.filePicking = FilePicking.choosing;
    notifyListeners();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      state.cvFile = File(result.files.single.path!);
      state.filePicking = FilePicking.done;
      notifyListeners();
    } else {
      state.filePicking = FilePicking.initial;
      notifyListeners();
    }
  }

  void fileRemoved() {
    state.cvFile = null;
    state.filePicking = FilePicking.initial;
    notifyListeners();
  }

  Future<void> uploadPortfolio() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    await PortfolioServices().addPortfolio(basename(state.cvFile!.path),
        state.cvFile!, shared.getString("id")!, shared.getString("token")!);
    state.cvFile = null;
    state.filePicking = FilePicking.initial;
    loadPorfolios();
    notifyListeners();
  }
}
