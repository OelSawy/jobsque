// To parse this JSON data, do
//
//     final updateProfileResponseModel = updateProfileResponseModelFromJson(jsonString);

import 'dart:convert';

UpdateProfileResponseModel updateProfileResponseModelFromJson(String str) => UpdateProfileResponseModel.fromJson(json.decode(str));

String updateProfileResponseModelToJson(UpdateProfileResponseModel data) => json.encode(data.toJson());

class UpdateProfileResponseModel {
    bool status;
    Data data;

    UpdateProfileResponseModel({
        required this.status,
        required this.data,
    });

    factory UpdateProfileResponseModel.fromJson(Map<String, dynamic> json) => UpdateProfileResponseModel(
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
    String name;
    String email;
    dynamic mobile;
    dynamic address;
    dynamic language;
    String interstedWork;
    String offlinePlace;
    String remotePlace;
    dynamic bio;
    dynamic educationId;
    dynamic experience;
    dynamic personalDetailes;
    DateTime createdAt;
    DateTime updatedAt;

    Data({
        required this.id,
        required this.userId,
        required this.name,
        required this.email,
        this.mobile,
        this.address,
        this.language,
        required this.interstedWork,
        required this.offlinePlace,
        required this.remotePlace,
        this.bio,
        this.educationId,
        this.experience,
        this.personalDetailes,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        address: json["address"],
        language: json["language"],
        interstedWork: json["intersted_work"],
        offlinePlace: json["offline_place"],
        remotePlace: json["remote_place"],
        bio: json["bio"],
        educationId: json["education_id"],
        experience: json["experience"],
        personalDetailes: json["personal_detailes"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "email": email,
        "mobile": mobile,
        "address": address,
        "language": language,
        "intersted_work": interstedWork,
        "offline_place": offlinePlace,
        "remote_place": remotePlace,
        "bio": bio,
        "education_id": educationId,
        "experience": experience,
        "personal_detailes": personalDetailes,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
