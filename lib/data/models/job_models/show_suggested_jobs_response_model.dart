// To parse this JSON data, do
//
//     final showSuggestedJobsResponseModel = showSuggestedJobsResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:jobsque/data/models/job_models/datum.dart';

ShowSuggestedJobsResponseModel showSuggestedJobsResponseModelFromJson(String str) => ShowSuggestedJobsResponseModel.fromJson(json.decode(str));

String showSuggestedJobsResponseModelToJson(ShowSuggestedJobsResponseModel data) => json.encode(data.toJson());

class ShowSuggestedJobsResponseModel {
    bool status;
    List<Datum> data;

    ShowSuggestedJobsResponseModel({
        required this.status,
        required this.data,
    });

    factory ShowSuggestedJobsResponseModel.fromJson(Map<String, dynamic> json) => ShowSuggestedJobsResponseModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}