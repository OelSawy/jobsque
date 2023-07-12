// To parse this JSON data, do
//
//     final editEducationResponseModel = editEducationResponseModelFromJson(jsonString);

import 'dart:convert';

EditEducationResponseModel editEducationResponseModelFromJson(String str) => EditEducationResponseModel.fromJson(json.decode(str));

String editEducationResponseModelToJson(EditEducationResponseModel data) => json.encode(data.toJson());

class EditEducationResponseModel {
    bool status;
    Data data;

    EditEducationResponseModel({
        required this.status,
        required this.data,
    });

    factory EditEducationResponseModel.fromJson(Map<String, dynamic> json) => EditEducationResponseModel(
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
    String universty;
    String title;
    String start;
    String end;
    int userId;
    String profileId;
    DateTime createdAt;
    DateTime updatedAt;

    Data({
        required this.id,
        required this.universty,
        required this.title,
        required this.start,
        required this.end,
        required this.userId,
        required this.profileId,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        universty: json["universty"],
        title: json["title"],
        start: json["start"],
        end: json["end"],
        userId: json["user_id"],
        profileId: json["profile_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "universty": universty,
        "title": title,
        "start": start,
        "end": end,
        "user_id": userId,
        "profile_id": profileId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
