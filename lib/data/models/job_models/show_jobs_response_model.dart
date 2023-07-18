// To parse this JSON data, do
//
//     final showJobsResponseModel = showJobsResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:jobsque/data/models/job_models/datum.dart';

ShowJobsResponseModel showJobsResponseModelFromJson(String str) => ShowJobsResponseModel.fromJson(json.decode(str));

String showJobsResponseModelToJson(ShowJobsResponseModel data) => json.encode(data.toJson());

class ShowJobsResponseModel {
    bool status;
    List<Datum> data;

    ShowJobsResponseModel({
        required this.status,
        required this.data,
    });

    factory ShowJobsResponseModel.fromJson(Map<String, dynamic> json) => ShowJobsResponseModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}
