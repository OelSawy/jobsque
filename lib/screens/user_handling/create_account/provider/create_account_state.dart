import 'package:flutter/material.dart';

class CreateAccountState {
  //! vars
  String? username;
  String? email;
  String? password;

  //! controllers
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //! errors
  String? usernameErrorMessage;
  String? emailErrorMessage;
  String? passwordErrorMessage;

  //! bools
  bool hidePass = true;

  //! categories
  
}