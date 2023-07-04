// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
    User user;
    String token;
    bool status;

    LoginResponseModel({
        required this.user,
        required this.token,
        required this.status,
    });

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
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
