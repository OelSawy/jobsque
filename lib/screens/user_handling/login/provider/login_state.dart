import 'package:flutter/material.dart';
import 'package:jobsque/data/models/auth_models/login_response_model.dart';

class LoginState {
  //! vars
  String? email;
  String? password;

  //! controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //! errors
  String? emailErrorMessage;
  String? passwordErrorMessage;

  //! bools
  bool hidePass = true;
  bool rememberMe = false;

  //! responses
  LoginResponseModel? loginResponseModel;
}