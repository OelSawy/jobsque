// To parse this JSON data, do
//
//     final editPorfolioResponseModel = editPorfolioResponseModelFromJson(jsonString);

import 'dart:convert';

EditPorfolioResponseModel editPorfolioResponseModelFromJson(String str) => EditPorfolioResponseModel.fromJson(json.decode(str));

String editPorfolioResponseModelToJson(EditPorfolioResponseModel data) => json.encode(data.toJson());

class EditPorfolioResponseModel {
    bool status;
    Data data;

    EditPorfolioResponseModel({
        required this.status,
        required this.data,
    });

    factory EditPorfolioResponseModel.fromJson(Map<String, dynamic> json) => EditPorfolioResponseModel(
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
