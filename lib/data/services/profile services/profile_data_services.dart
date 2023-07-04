import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:jobsque/data/core/api_routes.dart';
import 'package:jobsque/data/models/profile%20models/edit_bio_and_data_response_model.dart';
import 'package:jobsque/data/models/profile%20models/edit_language_response_model.dart';
import 'package:jobsque/data/models/profile%20models/update_profile_response_model.dart';

class ProfileDataServices {
  Future<UpdateProfileResponseModel> updateProfile(String id, String token, String intersted, String offline, String remote) async {
    Response response = await http.put(Uri.parse("${ApiRoutes.updateProfile}/$id"), headers: {"Authorization" : "Bearer $token"}, body: {"intersted_work" : intersted, "offline_place" : offline, "remote_place" : remote});
    UpdateProfileResponseModel updateProfileResponseModel = updateProfileResponseModelFromJson(response.body);
    return updateProfileResponseModel;
  }

  Future<EditBioAndDataResponseModel> editBioAndData(String id, String token, String bio, String address, String mobile) async {
    Response response = await http.put(Uri.parse("${ApiRoutes.editBioandData}/$id"), headers: {"Authorization" : "Bearer $token"}, body: {"bio" : bio, "address" : address, "mobile" : mobile});
    EditBioAndDataResponseModel editBioAndDataResponseModel = editBioAndDataResponseModelFromJson(response.body);
    return editBioAndDataResponseModel;
  }

  Future<EditLanguageResponseModel> editLanguage(String id, String token, String language) async {
    Response response = await http.put(Uri.parse("${ApiRoutes.editLanguage}/$id"), headers: {"Authorization" : "Bearer $token"}, body: {"language" : language});
    EditLanguageResponseModel editLanguageResponseModel = editLanguageResponseModelFromJson(response.body);
    return editLanguageResponseModel;
  }
}