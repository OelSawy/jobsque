import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:jobsque/core/enums.dart';
import 'package:jobsque/data/models/job_models/datum.dart';

class JobDetailsState {
  
  //! controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  //! errors
  String? nameErrorMessage;
  String? emailErrorMessage;

  //!variables
  String? name;
  String? email;
  PhoneNumber? phoneNumber;

  int? appliedJobIndex;
  bool applicant = false;
  bool accepted = false;

  String? phoneErrorMessgae;

  File? portfolio;

  FilePicking filePicking = FilePicking.initial;

  Datum? appliedJob;

  String? jobType;
}