import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'package:jobsque/data/core/api_routes.dart';
import 'package:jobsque/data/models/auth_models/get_otp_response_model.dart';
import 'package:jobsque/data/models/auth_models/get_profile_response_model.dart';
import 'package:jobsque/data/models/auth_models/update_name_and_password_response_model.dart';

class ProfileServices {
  Future<GetProfileResponseModel> getProfile(String id, String token) async {
    Response response = await http.get(Uri.parse("${ApiRoutes.getProfile}/$id"),
        headers: {"Authorization": "Bearer $token"});
    GetProfileResponseModel getProfileResponseModel =
        getProfileResponseModelFromJson(response.body);
    return getProfileResponseModel;
  }

  Future<GetOtpResponseModel> getOtp(String email, String token) async {
    Response response = await http.get(Uri.parse("${ApiRoutes.getOtp}/$email"),
        headers: {"Authorization": "Bearer $token"});
    GetOtpResponseModel getOtpResponseModel =
        getOtpResponseModelFromJson(response.body);
    return getOtpResponseModel;
  }

  Future<UpdateNameAndPasswordResponseModel> updateName(
      String id, String token, String name) async {
    Response response = await http.put(
        Uri.parse("${ApiRoutes.updateNameAndPassword}/$id"),
        headers: {"Authorization": "Bearer $token"},
        body: {"name": name});
    UpdateNameAndPasswordResponseModel updateNameAndPasswordResponseModel =
        updateNameAndPasswordResponseModelFromJson(response.body);
    return updateNameAndPasswordResponseModel;
  }

  Future<UpdateNameAndPasswordResponseModel> updatePassword(
      String id, String token, String password) async {
    Response response = await http.put(
        Uri.parse("${ApiRoutes.updateNameAndPassword}/$id"),
        headers: {"Authorization": "Bearer $token"},
        body: {"password": password});
    UpdateNameAndPasswordResponseModel updateNameAndPasswordResponseModel =
        updateNameAndPasswordResponseModelFromJson(response.body);
    return updateNameAndPasswordResponseModel;
  }
}
