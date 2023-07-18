// To parse this JSON data, do
//
//     final deletePorfolioResponseModel = deletePorfolioResponseModelFromJson(jsonString);

import 'dart:convert';

DeletePorfolioResponseModel deletePorfolioResponseModelFromJson(String str) => DeletePorfolioResponseModel.fromJson(json.decode(str));

String deletePorfolioResponseModelToJson(DeletePorfolioResponseModel data) => json.encode(data.toJson());

class DeletePorfolioResponseModel {
    bool status;
    String massage;
    Data data;

    DeletePorfolioResponseModel({
        required this.status,
        required this.massage,
        required this.data,
    });

    factory DeletePorfolioResponseModel.fromJson(Map<String, dynamic> json) => DeletePorfolioResponseModel(
        status: json["status"],
        massage: json["massage"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "massage": massage,
        "data": data.toJson(),
    };
}

class Data {
    int id;
    String cvFile;
    String name;
    int userId;
    int profileId;
    DateTime createdAt;
    DateTime updatedAt;

    Data({
        required this.id,
        required this.cvFile,
        required this.name,
        required this.userId,
        required this.profileId,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        cvFile: json["cv_file"],
        name: json["name"],
        userId: json["user_id"],
        profileId: json["profile_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "cv_file": cvFile,
        "name": name,
        "user_id": userId,
        "profile_id": profileId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
