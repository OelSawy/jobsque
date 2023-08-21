// To parse this JSON data, do
//
//     final getAppliedJobsResponseModel = getAppliedJobsResponseModelFromJson(jsonString);

import 'dart:convert';

GetAppliedJobsResponseModel getAppliedJobsResponseModelFromJson(String str) => GetAppliedJobsResponseModel.fromJson(json.decode(str));

String getAppliedJobsResponseModelToJson(GetAppliedJobsResponseModel data) => json.encode(data.toJson());

class GetAppliedJobsResponseModel {
    bool status;
    List<DatumA> data;

    GetAppliedJobsResponseModel({
        required this.status,
        required this.data,
    });

    factory GetAppliedJobsResponseModel.fromJson(Map<String, dynamic> json) => GetAppliedJobsResponseModel(
        status: json["status"],
        data: List<DatumA>.from(json["data"].map((x) => DatumA.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class DatumA {
    int id;
    String name;
    String email;
    String mobile;
    String workType;
    String? cvFile;
    String otherFile;
    int jobsId;
    int userId;
    int reviewed;
    dynamic accept;
    DateTime createdAt;
    DateTime updatedAt;

    DatumA({
        required this.id,
        required this.name,
        required this.email,
        required this.mobile,
        required this.workType,
        required this.cvFile,
        required this.otherFile,
        required this.jobsId,
        required this.userId,
        required this.reviewed,
        required this.accept,
        required this.createdAt,
        required this.updatedAt,
    });

    factory DatumA.fromJson(Map<String, dynamic> json) => DatumA(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        workType: json["work_type"],
        cvFile: json["cv_file"],
        otherFile: json["other_file"],
        jobsId: json["jobs_id"],
        userId: json["user_id"],
        reviewed: json["reviewed"],
        accept: json["accept"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mobile": mobile,
        "work_type": workType,
        "cv_file": cvFile,
        "other_file": otherFile,
        "jobs_id": jobsId,
        "user_id": userId,
        "reviewed": reviewed,
        "accept": accept,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
