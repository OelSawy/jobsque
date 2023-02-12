import 'package:flutter/material.dart';

class ResetPasswordState {
  //! vars
  String? email;
  String? newPass;
  String? confirmNewPass;

  //! controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmNewPassController = TextEditingController();

  //! errors
  String? emailErrorMessage;
  String? newPassErrorMessage;
  String? confirmNewPassErrorMessage;

  //! bools
  bool hideNewPass = true;
  bool hideConfirmNewPass = true;
}