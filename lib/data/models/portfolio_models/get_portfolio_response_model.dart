// To parse this JSON data, do
//
//     final getPorfolioResponseModel = getPorfolioResponseModelFromJson(jsonString);

import 'dart:convert';

GetPorfolioResponseModel getPorfolioResponseModelFromJson(String str) => GetPorfolioResponseModel.fromJson(json.decode(str));

String getPorfolioResponseModelToJson(GetPorfolioResponseModel data) => json.encode(data.toJson());

class GetPorfolioResponseModel {
    bool status;
    List<Datum> data;

    GetPorfolioResponseModel({
        required this.status,
        required this.data,
    });

    factory GetPorfolioResponseModel.fromJson(Map<String, dynamic> json) => GetPorfolioResponseModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String cvFile;
    String name;
    int userId;
    int profileId;
    DateTime createdAt;
    DateTime updatedAt;

    Datum({
        required this.id,
        required this.cvFile,
        required this.name,
        required this.userId,
        required this.profileId,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
