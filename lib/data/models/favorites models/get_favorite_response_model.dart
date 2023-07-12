// To parse this JSON data, do
//
//     final getFavoriteResponseModel = getFavoriteResponseModelFromJson(jsonString);

import 'dart:convert';

GetFavoriteResponseModel getFavoriteResponseModelFromJson(String str) => GetFavoriteResponseModel.fromJson(json.decode(str));

String getFavoriteResponseModelToJson(GetFavoriteResponseModel data) => json.encode(data.toJson());

class GetFavoriteResponseModel {
    bool status;
    List<Datum> data;

    GetFavoriteResponseModel({
        required this.status,
        required this.data,
    });

    factory GetFavoriteResponseModel.fromJson(Map<String, dynamic> json) => GetFavoriteResponseModel(
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
    int userId;
    int like;
    int jobId;
    String image;
    String name;
    String location;
    DateTime createdAt;
    DateTime updatedAt;

    Datum({
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

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
