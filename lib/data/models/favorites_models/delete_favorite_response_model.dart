// To parse this JSON data, do
//
//     final deleteFavoriteResponseModel = deleteFavoriteResponseModelFromJson(jsonString);

import 'dart:convert';

DeleteFavoriteResponseModel deleteFavoriteResponseModelFromJson(String str) => DeleteFavoriteResponseModel.fromJson(json.decode(str));

String deleteFavoriteResponseModelToJson(DeleteFavoriteResponseModel data) => json.encode(data.toJson());

class DeleteFavoriteResponseModel {
    bool status;
    Data data;

    DeleteFavoriteResponseModel({
        required this.status,
        required this.data,
    });

    factory DeleteFavoriteResponseModel.fromJson(Map<String, dynamic> json) => DeleteFavoriteResponseModel(
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
    int userId;
    int like;
    int jobId;
    String image;
    String name;
    String location;
    DateTime createdAt;
    DateTime updatedAt;

    Data({
        required this.id,
        required this.userId,
        required this.like,
        required this.jobId,
        required this.image,
        required this.name,
        required this.location,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        like: json["like"],
        jobId: json["job_id"],
        image: json["image"],
        name: json["name"],
        location: json["location"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "like": like,
        "job_id": jobId,
        "image": image,
        "name": name,
        "location": location,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
