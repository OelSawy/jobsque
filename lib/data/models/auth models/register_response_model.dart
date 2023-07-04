// To parse this JSON data, do
//
//     final registerResponseModel = registerResponseModelFromJson(jsonString);

import 'dart:convert';

RegisterResponseModel registerResponseModelFromJson(String str) => RegisterResponseModel.fromJson(json.decode(str));

String registerResponseModelToJson(RegisterResponseModel data) => json.encode(data.toJson());

class RegisterResponseModel {
    bool status;
    Data data;
    Data profile;
    String token;

    RegisterResponseModel({
        required this.status,
        required this.data,
        required this.profile,
        required this.token,
    });

    factory RegisterResponseModel.fromJson(Map<String, dynamic> json) => RegisterResponseModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
        profile: Data.fromJson(json["profile"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "profile": profile.toJson(),
        "token": token,
    };
}

class Data {
    String name;
    String email;
    int? otp;
    DateTime updatedAt;
    DateTime createdAt;
    int id;
    int? userId;

    Data({
        required this.name,
        required this.email,
        this.otp,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
        this.userId,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        email: json["email"],
        otp: json["otp"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "otp": otp,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
        "user_id": userId,
    };
}
