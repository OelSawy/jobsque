// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

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

class User {
    int id;
    String name;
    String otp;
    dynamic towStep;
    String email;
    dynamic emailVerifiedAt;
    DateTime createdAt;
    DateTime updatedAt;

    User({
        required this.id,
        required this.name,
        required this.otp,
        this.towStep,
        required this.email,
        this.emailVerifiedAt,
        required this.createdAt,
        required this.updatedAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        otp: json["otp"],
        towStep: json["tow_step"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "otp": otp,
        "tow_step": towStep,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
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
