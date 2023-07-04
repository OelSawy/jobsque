// To parse this JSON data, do
//
//     final getProfileResponseModel = getProfileResponseModelFromJson(jsonString);

import 'dart:convert';

GetProfileResponseModel getProfileResponseModelFromJson(String str) => GetProfileResponseModel.fromJson(json.decode(str));

String getProfileResponseModelToJson(GetProfileResponseModel data) => json.encode(data.toJson());

class GetProfileResponseModel {
    Data data;
    bool status;

    GetProfileResponseModel({
        required this.data,
        required this.status,
    });

    factory GetProfileResponseModel.fromJson(Map<String, dynamic> json) => GetProfileResponseModel(
        data: Data.fromJson(json["data"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "status": status,
    };
}

class Data {
    int id;
    String name;
    String otp;
    dynamic towStep;
    String email;
    dynamic emailVerifiedAt;
    DateTime createdAt;
    DateTime updatedAt;

    Data({
        required this.id,
        required this.name,
        required this.otp,
        this.towStep,
        required this.email,
        this.emailVerifiedAt,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
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
