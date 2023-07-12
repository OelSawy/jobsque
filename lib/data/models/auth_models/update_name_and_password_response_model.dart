// To parse this JSON data, do
//
//     final updateNameAndPasswordResponseModel = updateNameAndPasswordResponseModelFromJson(jsonString);

import 'dart:convert';

UpdateNameAndPasswordResponseModel updateNameAndPasswordResponseModelFromJson(String str) => UpdateNameAndPasswordResponseModel.fromJson(json.decode(str));

String updateNameAndPasswordResponseModelToJson(UpdateNameAndPasswordResponseModel data) => json.encode(data.toJson());

class UpdateNameAndPasswordResponseModel {
    bool status;
    Data data;

    UpdateNameAndPasswordResponseModel({
        required this.status,
        required this.data,
    });

    factory UpdateNameAndPasswordResponseModel.fromJson(Map<String, dynamic> json) => UpdateNameAndPasswordResponseModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
    };
}

class Data {
    int id;
    String name;
    String otp;
    String email;
    DateTime createdAt;
    DateTime updatedAt;

    Data({
        required this.id,
        required this.name,
        required this.otp,
        required this.email,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        otp: json["otp"],
        email: json["email"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "otp": otp,
        "email": email,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
