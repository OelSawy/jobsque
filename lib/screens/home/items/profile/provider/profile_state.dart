import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class ProfileState {
  //! controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  //! vars
  String? name;
  String? bio;
  String? address;
  PhoneNumber? phone;

  //! errors
  String? nameErrorMessage;
  String? bioErrorMessage;
  String? addressErrorMessage;
  String? phoneErrorMessgae;

  //! notification options
  bool jobSearchAlert = false;
  bool jobApplicationUpdate = false;
  bool jobApplicationReminders = false;
  bool interestedInJobs = false;
  bool jobSeekerUpdates = false;
  bool showProfile = false;
  bool allMessages = false;
  bool messageNudges = false;
}