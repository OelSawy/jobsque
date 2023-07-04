import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/core/enums.dart';
import 'package:jobsque/screens/home/items/profile/provider/profile_state.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

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

  void saveProfile(BuildContext context) {
    Navigator.pop(context);
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

  void changePassword(BuildContext context) {
    if (checkPasswords()) {
      if (state.newPass == state.confirmNewPass) {
        if (state.newPass == state.oldPass) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("New password can't be the same as old password")));
        } else {
          Navigator.of(context).pop();
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Passwords don't match")));
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
}
