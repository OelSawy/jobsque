// To parse this JSON data, do
//
//     final addExperienceResponseModel = addExperienceResponseModelFromJson(jsonString);

import 'dart:convert';

AddExperienceResponseModel addExperienceResponseModelFromJson(String str) => AddExperienceResponseModel.fromJson(json.decode(str));

String addExperienceResponseModelToJson(AddExperienceResponseModel data) => json.encode(data.toJson());

class AddExperienceResponseModel {
    bool status;
    Data data;

    AddExperienceResponseModel({
        required this.status,
        required this.data,
    });

    factory AddExperienceResponseModel.fromJson(Map<String, dynamic> json) => AddExperienceResponseModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
    };
}

class Data {
    String userId;
    String postion;
    String typeWork;
    String compName;
    String location;
    String start;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    Data({
        required this.userId,
        required this.postion,
        required this.typeWork,
        required this.compName,
        required this.location,
        required this.start,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        postion: json["postion"],
        typeWork: json["type_work"],
        compName: json["comp_name"],
        location: json["location"],
        start: json["start"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "postion": postion,
        "type_work": typeWork,
        "comp_name": compName,
        "location": location,
        "start": start,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}
