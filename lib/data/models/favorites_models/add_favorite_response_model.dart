// To parse this JSON data, do
//
//     final addFavoriteResponseModel = addFavoriteResponseModelFromJson(jsonString);

import 'dart:convert';

AddFavoriteResponseModel addFavoriteResponseModelFromJson(String str) => AddFavoriteResponseModel.fromJson(json.decode(str));

String addFavoriteResponseModelToJson(AddFavoriteResponseModel data) => json.encode(data.toJson());

class AddFavoriteResponseModel {
    bool status;
    DataF data;

    AddFavoriteResponseModel({
        required this.status,
        required this.data,
    });

    factory AddFavoriteResponseModel.fromJson(Map<String, dynamic> json) => AddFavoriteResponseModel(
        status: json["status"],
        data: DataF.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
    };
}

DataF savedFromJson(String str) => DataF.fromJson(json.decode(str));

String savedToJson(DataF data) => json.encode(data.toJson());

class DataF {
    String userId;
    String jobId;
    bool like;
    String image;
    String name;
    String location;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    DataF({
        required this.userId,
        required this.jobId,
        required this.like,
        required this.image,
        required this.name,
        required this.location,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
    });

    factory DataF.fromJson(Map<String, dynamic> json) => DataF(
        userId: json["user_id"],
        jobId: json["job_id"],
        like: json["like"],
        image: json["image"],
        name: json["name"],
        location: json["location"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "job_id": jobId,
        "like": like,
        "image": image,
        "name": name,
        "location": location,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}
