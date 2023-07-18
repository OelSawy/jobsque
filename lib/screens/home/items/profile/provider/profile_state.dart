import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:jobsque/core/enums.dart';
import 'package:jobsque/data/models/portfolio_models/get_portfolio_response_model.dart';

class ProfileState {
  //! controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmNewPassController = TextEditingController();

  TextEditingController phoneVerificationPassController =
      TextEditingController();

  TextEditingController code1Controller = TextEditingController();
  TextEditingController code2Controller = TextEditingController();
  TextEditingController code3Controller = TextEditingController();
  TextEditingController code4Controller = TextEditingController();
  TextEditingController code5Controller = TextEditingController();
  TextEditingController code6Controller = TextEditingController();

  //! vars
  String? name;
  String? bio;
  String? address;
  PhoneNumber? phone;
  String? email;

  String? oldPass;
  String? newPass;
  String? confirmNewPass;

  String? phoneVerificationPass;

  String? code1;
  String? code2;
  String? code3;
  String? code4;
  String? code5;
  String? code6;

  //! errors
  String? nameErrorMessage;
  String? bioErrorMessage;
  String? addressErrorMessage;
  String? phoneErrorMessgae;
  String? emailErrorMessage;

  String? oldPassErrorMessage;
  String? newPassErrorMessage;
  String? confirmNewPassErrorMessage;

  String? phoneVerificationPassErrorMessage;

  //! notification options
  bool jobSearchAlert = false;
  bool jobApplicationUpdate = false;
  bool jobApplicationReminders = false;
  bool interestedInJobs = false;
  bool jobSeekerUpdates = false;
  bool showProfile = false;
  bool allMessages = false;
  bool messageNudges = false;

  //! phone verification
  bool phoneToResetPass = false;

  //! password reset
  bool hideOldPass = true;
  bool hideNewPass = true;
  bool hideConfirmNewPass = true;

  bool hidePhoneVerificationPass = true;

  //! 2 factor authentication
  bool isTwoFactorAuthEnabled = false;
  VerificationMethod verificationMethod = VerificationMethod.sms;

  String? phoneVerificationErrorMessgae;

  PhoneNumber? phoneVerification;

  LoadingState detailsLoadingState = LoadingState.initial;

  LoadingState portfolioLoadingState = LoadingState.initial;

  List<Datum> portfolios = [];

  String? portfolioName;
  String? portfoioNameErrorMessage;
  TextEditingController portfolioController = TextEditingController();

  FilePicking filePicking = FilePicking.initial;

  File? cvFile;
}
