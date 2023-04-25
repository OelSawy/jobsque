import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:jobsque/core/app_routes.dart';
import 'package:jobsque/screens/job_details_and_application/provider/job_details_state.dart';

class JobDetailsProvider extends ChangeNotifier {
  JobDetailsState state = JobDetailsState();

  void onNameChange(String value) {
    value.isEmpty
        ? state.nameErrorMessage = "You must enter a username"
        : state.nameErrorMessage = null;
    state.name = value;
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

  void onPhoneNumberChange(PhoneNumber value) {
    value.toString().isEmpty ? state.phoneErrorMessgae = "Phone is required" : state.phoneErrorMessgae = null;
    state.phoneNumber = value;
    notifyListeners();
  }

  bool validateBiodata() {
    if (state.name != null &&
        state.email != null &&
        state.phoneNumber != null &&
        state.nameErrorMessage == null &&
        state.emailErrorMessage == null) {
      return true;
    } else {
      return false;
    }
  }

  void biodataSubmitted(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.applicationType);
  }

  void typeSubmitted(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.applicationPortfolio);
  }

  void portfolioSubmitted(BuildContext context) {
    state.applicant = true;
    notifyListeners();
    Navigator.of(context).pushNamed(AppRoutes.applicationSuccessful);
  }

  apply(BuildContext context, int index) {
    state.applicant = false;
    state.appliedJobIndex = index;
    notifyListeners();
    Navigator.of(context).pushNamed(AppRoutes.applicationBiodata);
  }

  Future<void> accept() async {
    Future.delayed(const Duration(seconds: 5));
    state.accepted = true;
    notifyListeners();
  }
}
