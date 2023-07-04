// To parse this JSON data, do
//
//     final getOtpResponseModel = getOtpResponseModelFromJson(jsonString);

import 'dart:convert';

GetOtpResponseModel getOtpResponseModelFromJson(String str) => GetOtpResponseModel.fromJson(json.decode(str));

String getOtpResponseModelToJson(GetOtpResponseModel data) => json.encode(data.toJson());

class GetOtpResponseModel {
    bool status;
    String data;

    GetOtpResponseModel({
        required this.status,
        required this.data,
    });

    factory GetOtpResponseModel.fromJson(Map<String, dynamic> json) => GetOtpResponseModel(
        status: json["status"],
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data,
    };
}
