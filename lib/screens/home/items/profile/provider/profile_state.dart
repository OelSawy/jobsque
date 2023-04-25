import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

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

  //! vars
  String? name;
  String? bio;
  String? address;
  PhoneNumber? phone;
  String? email;

  String? oldPass;
  String? newPass;
  String? confirmNewPass;

  //! errors
  String? nameErrorMessage;
  String? bioErrorMessage;
  String? addressErrorMessage;
  String? phoneErrorMessgae;
  String? emailErrorMessage;

  String? oldPassErrorMessage;
  String? newPassErrorMessage;
  String? confirmNewPassErrorMessage;

  //! notification options
  bool jobSearchAlert = false;
  bool jobApplicationUpdate = false;
  bool jobApplicationReminders = false;
  bool interestedInJobs = false;
  bool jobSeekerUpdates = false;
  bool showProfile = false;
  bool allMessages = false;
  bool messageNudges = false;

  bool phoneToResetPass = false;

  bool hideOldPass = true;
  bool hideNewPass = true;
  bool hideConfirmNewPass = true;
}
