import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:jobsque/core/app_routes.dart';
import 'package:jobsque/data/models/job_models/datum.dart';
import 'package:jobsque/screens/job_details_and_application/provider/job_details_state.dart';
import 'package:url_launcher/url_launcher.dart';

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
    value.toString().isEmpty
        ? state.phoneErrorMessgae = "Phone is required"
        : state.phoneErrorMessgae = null;
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

  apply(BuildContext context, Datum job) {
    state.applicant = false;
    // state.appliedJobIndex = index;
    notifyListeners();
    Navigator.of(context).pushNamed(AppRoutes.applicationBiodata);
  }

  Future<void> accept() async {
    Future.delayed(const Duration(seconds: 5));
    state.accepted = true;
    notifyListeners();
  }

  Future<void> openUrl(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
      throw "Could not launch url";
    }
  }

  Future<void> openMail(String address) async {
    if (!await launchUrl(Uri.parse("mailto:$address"))) {
      throw "Could not launch mail app";
    }
  }
}
