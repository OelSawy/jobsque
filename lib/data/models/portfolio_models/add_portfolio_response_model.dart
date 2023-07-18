// To parse this JSON data, do
//
//     final addPorfolioResponseModel = addPorfolioResponseModelFromJson(jsonString);

import 'dart:convert';

AddPorfolioResponseModel addPorfolioResponseModelFromJson(String str) => AddPorfolioResponseModel.fromJson(json.decode(str));

String addPorfolioResponseModelToJson(AddPorfolioResponseModel data) => json.encode(data.toJson());

class AddPorfolioResponseModel {
    bool status;
    Data data;

    AddPorfolioResponseModel({
        required this.status,
        required this.data,
    });

    factory AddPorfolioResponseModel.fromJson(Map<String, dynamic> json) => AddPorfolioResponseModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
    };
}

class Data {
    String name;
    String userId;
    int profileId;
    String cvFile;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    Data({
        required this.name,
        required this.userId,
        required this.profileId,
        required this.cvFile,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        userId: json["user_id"],
        profileId: json["profile_id"],
        cvFile: json["cv_file"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "user_id": userId,
        "profile_id": profileId,
        "cv_file": cvFile,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}
