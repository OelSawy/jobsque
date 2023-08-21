// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

import 'get_profile_response_model.dart';

class LoginResponseModel {

}

LoginResponseModelApproved loginResponseModelApprovedFromJson(String str) => LoginResponseModelApproved.fromJson(json.decode(str));

String loginResponseModelApprovedToJson(LoginResponseModelApproved data) => json.encode(data.toJson());

class LoginResponseModelApproved extends LoginResponseModel {
    User user;
    String token;
    bool status;

    LoginResponseModelApproved({
        required this.user,
        required this.token,
        required this.status,
    });

    factory LoginResponseModelApproved.fromJson(Map<String, dynamic> json) => LoginResponseModelApproved(
        user: User.fromJson(json["user"]),
        token: json["token"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
        "status": status,
    };
}

LoginResponseModelDenied loginResponseModelDeniedFromJson(String str) => LoginResponseModelDenied.fromJson(json.decode(str));

String loginResponseModelDeniedToJson(LoginResponseModelDenied data) => json.encode(data.toJson());

class LoginResponseModelDenied extends LoginResponseModel {
    String massage;
    bool status;

    LoginResponseModelDenied({
        required this.massage,
        required this.status,
    });

    factory LoginResponseModelDenied.fromJson(Map<String, dynamic> json) => LoginResponseModelDenied(
        massage: json["massage"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "massage": massage,
        "status": status,
    };
}
