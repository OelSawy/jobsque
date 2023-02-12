import 'package:flutter/material.dart';

class LoginState {
  //! vars
  String? username;
  String? password;

  //! controllers
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //! errors
  String? usernameErrorMessage;
  String? passwordErrorMessage;

  //! bools
  bool hidePass = true;
  bool rememberMe = false;
}