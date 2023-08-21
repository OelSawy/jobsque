import 'dart:io';

import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:jobsque/core/app_routes.dart';
import 'package:jobsque/core/enums.dart';
import 'package:jobsque/data/core/api_routes.dart';
import 'package:jobsque/data/models/job_models/datum.dart';
import 'package:jobsque/screens/job_details_and_application/provider/job_details_state.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  void typeSubmitted(BuildContext context, String jobType) {
    state.jobType = jobType;
    Navigator.of(context).pushNamed(AppRoutes.applicationPortfolio);
  }

  Future<void> portfolioSubmitted(BuildContext context) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    Dio dio = Dio();

    FormData data = FormData.fromMap({
      "name": basename(state.portfolio!.path),
      "cv_file": await MultipartFile.fromFile(state.portfolio!.path,
          filename: basename(state.portfolio!.path)),
      "user_id": shared.getString("id")!,
      "email": state.email,
      "mobile": state.phoneNumber,
      "jobs_id": state.appliedJob!.id,
      "work_type": state.jobType
    });

    await dio.post(ApiRoutes.applyJob,
        data: data,
        options: Options(
          headers: {"Authorization": "Bearer ${shared.getString("token")!}"},
          followRedirects: false,
          validateStatus: (status) {
            print(status!);
            return true;
          },
        )).then((value) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Job application successful")));
          Navigator.popUntil(context, ModalRoute.withName("/jobDetails"));
        });
    
  }

  void apply(BuildContext context, Datum job) {
    state.appliedJob = job;
    notifyListeners();
    Navigator.of(context).pushNamed(AppRoutes.applicationBiodata);
  }

  Future<void> accept() async {
    Future.delayed(const Duration(seconds: 5));
    state.accepted = true;
    notifyListeners();
  }

  Future<void> openUrl(String url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw "Could not launch url";
    }
  }

  Future<void> openMail(String address) async {
    if (!await launchUrl(Uri.parse("mailto:$address"))) {
      throw "Could not launch mail app";
    }
  }

  Future<void> addPortfolio() async {
    state.filePicking = FilePicking.choosing;
    notifyListeners();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      state.portfolio = File(result.files.single.path!);
      state.filePicking = FilePicking.done;
      notifyListeners();
    } else {
      state.filePicking = FilePicking.initial;
      notifyListeners();
    }
  }

  void fileRemoved() {
    state.portfolio = null;
    state.filePicking = FilePicking.initial;
    notifyListeners();
  }

  void clearAll() {
    state.name = null;
    state.email = null;
    state.phoneNumber = null;
    state.nameController.clear();
    state.emailController.clear();
    state.nameErrorMessage = null;
    state.emailErrorMessage = null;
    state.phoneErrorMessgae = null;
    state.portfolio = null;
    state.filePicking = FilePicking.initial;
  }
}
