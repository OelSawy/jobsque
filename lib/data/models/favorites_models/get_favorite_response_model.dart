// To parse this JSON data, do
//
//     final getFavoriteResponseModelDenied = getFavoriteResponseModelDeniedFromJson(jsonString);

import 'dart:convert';

class GetFavoriteResponseModel {

}

GetFavoriteResponseModelDenied getFavoriteResponseModelDeniedFromJson(String str) => GetFavoriteResponseModelDenied.fromJson(json.decode(str));

String getFavoriteResponseModelDeniedToJson(GetFavoriteResponseModelDenied data) => json.encode(data.toJson());

class GetFavoriteResponseModelDenied extends GetFavoriteResponseModel{
    bool status;
    String message;

    GetFavoriteResponseModelDenied({
        required this.status,
        required this.message,
    });

    factory GetFavoriteResponseModelDenied.fromJson(Map<String, dynamic> json) => GetFavoriteResponseModelDenied(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}

GetFavoriteResponseModelApproved getFavoriteResponseModelApprovedFromJson(String str) => GetFavoriteResponseModelApproved.fromJson(json.decode(str));

String getFavoriteResponseModelApprovedToJson(GetFavoriteResponseModelApproved data) => json.encode(data.toJson());

class GetFavoriteResponseModelApproved extends GetFavoriteResponseModel{
    bool status;
    List<DatumF> data;

    GetFavoriteResponseModelApproved({
        required this.status,
        required this.data,
    });

    factory GetFavoriteResponseModelApproved.fromJson(Map<String, dynamic> json) => GetFavoriteResponseModelApproved(
        status: json["status"],
        data: List<DatumF>.from(json["data"].map((x) => DatumF.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class DatumF {
    int id;
    int userId;
    int like;
    int jobId;
    String image;
    String name;
    String location;
    DateTime createdAt;
    DateTime updatedAt;

    DatumF({
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

    factory DatumF.fromJson(Map<String, dynamic> json) => DatumF(
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