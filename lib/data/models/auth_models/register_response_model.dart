// To parse this JSON data, do
//
//     final registerResponseModelApproved = registerResponseModelApprovedFromJson(jsonString);

import 'dart:convert';

class RegisterResponseModel {}

RegisterResponseModelApproved registerResponseModelApprovedFromJson(String str) => RegisterResponseModelApproved.fromJson(json.decode(str));

String registerResponseModelApprovedToJson(RegisterResponseModelApproved data) => json.encode(data.toJson());

class RegisterResponseModelApproved extends RegisterResponseModel{
    bool status;
    Data data;
    Data profile;
    String token;

    RegisterResponseModelApproved({
        required this.status,
        required this.data,
        required this.profile,
        required this.token,
    });

    factory RegisterResponseModelApproved.fromJson(Map<String, dynamic> json) => RegisterResponseModelApproved(
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


RegisterResponseModelDenied registerResponseModelDeniedFromJson(String str) => RegisterResponseModelDenied.fromJson(json.decode(str));

String registerResponseModelDeniedToJson(RegisterResponseModelDenied data) => json.encode(data.toJson());

class RegisterResponseModelDenied extends RegisterResponseModel {
    Massege massege;
    bool status;

    RegisterResponseModelDenied({
        required this.status,
        required this.massege,
    });

    factory RegisterResponseModelDenied.fromJson(Map<String, dynamic> json) => RegisterResponseModelDenied(
        status: json["status"],
        massege: Massege.fromJson(json["massege"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "massege": massege.toJson(),
    };
}

class Massege {
    List<String> email;

    Massege({
        required this.email,
    });

    factory Massege.fromJson(Map<String, dynamic> json) => Massege(
        email: List<String>.from(json["email"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "email": List<dynamic>.from(email.map((x) => x)),
    };
}
