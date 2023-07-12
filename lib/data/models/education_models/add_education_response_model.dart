// To parse this JSON data, do
//
//     final addEducationResponseModel = addEducationResponseModelFromJson(jsonString);

import 'dart:convert';

AddEducationResponseModel addEducationResponseModelFromJson(String str) => AddEducationResponseModel.fromJson(json.decode(str));

String addEducationResponseModelToJson(AddEducationResponseModel data) => json.encode(data.toJson());

class AddEducationResponseModel {
    bool status;
    Data data;

    AddEducationResponseModel({
        required this.status,
        required this.data,
    });

    factory AddEducationResponseModel.fromJson(Map<String, dynamic> json) => AddEducationResponseModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
    };
}

class Data {
    String universty;
    String title;
    String start;
    String end;
    String userId;
    int profileId;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    Data({
        required this.universty,
        required this.title,
        required this.start,
        required this.end,
        required this.userId,
        required this.profileId,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        universty: json["universty"],
        title: json["title"],
        start: json["start"],
        end: json["end"],
        userId: json["user_id"],
        profileId: json["profile_id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "universty": universty,
        "title": title,
        "start": start,
        "end": end,
        "user_id": userId,
        "profile_id": profileId,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}
