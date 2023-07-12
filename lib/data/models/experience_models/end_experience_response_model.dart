// To parse this JSON data, do
//
//     final endExperienceResponseModel = endExperienceResponseModelFromJson(jsonString);

import 'dart:convert';

EndExperienceResponseModel endExperienceResponseModelFromJson(String str) => EndExperienceResponseModel.fromJson(json.decode(str));

String endExperienceResponseModelToJson(EndExperienceResponseModel data) => json.encode(data.toJson());

class EndExperienceResponseModel {
    bool status;
    Data data;

    EndExperienceResponseModel({
        required this.status,
        required this.data,
    });

    factory EndExperienceResponseModel.fromJson(Map<String, dynamic> json) => EndExperienceResponseModel(
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
    String userId;
    String postion;
    String typeWork;
    String compName;
    String location;
    String start;
    String end;
    DateTime createdAt;
    DateTime updatedAt;

    Data({
        required this.id,
        required this.userId,
        required this.postion,
        required this.typeWork,
        required this.compName,
        required this.location,
        required this.start,
        required this.end,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        postion: json["postion"],
        typeWork: json["type_work"],
        compName: json["comp_name"],
        location: json["location"],
        start: json["start"],
        end: json["end"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "postion": postion,
        "type_work": typeWork,
        "comp_name": compName,
        "location": location,
        "start": start,
        "end": end,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
