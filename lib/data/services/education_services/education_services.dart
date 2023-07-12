import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:jobsque/data/core/api_routes.dart';
import 'package:jobsque/data/models/education_models/add_education_response_model.dart';
import 'package:jobsque/data/models/education_models/edit_education_response_model.dart';
import 'package:jobsque/data/models/education_models/get_education_response_model.dart';

class EducationServices {
  Future<AddEducationResponseModel> addEducation(String id, String university,
      String title, String start, String end, String token) async {
    Response response =
        await http.post(Uri.parse(ApiRoutes.addEducation), headers: {
      "Authorization": "Bearer $token"
    }, body: {
      "university": university,
      "title": title,
      "start": start,
      "end": end,
      "user_id": id
    });
    AddEducationResponseModel addEducationResponseModel =
        addEducationResponseModelFromJson(response.body);
    return addEducationResponseModel;
  }

  Future<GetEducationResponseModel> getEducation(
      String id, String token) async {
    Response response =
        await http.get(Uri.parse("${ApiRoutes.getEducation}/$id"));
    GetEducationResponseModel getEducationResponseModel =
        getEducationResponseModelFromJson(response.body);
    return getEducationResponseModel;
  }

  Future<EditEducationResponseModel> editEducation(
      String university,
      String title,
      String start,
      String end,
      String uniId,
      String token) async {
    Response response =
        await http.put(Uri.parse(ApiRoutes.editEducation), headers: {
      "Authorization": "Bearer $token"
    }, body: {
      "university": university,
      "title": title,
      "start": start,
      "end": end,
      "id": uniId
    });
    EditEducationResponseModel editEducationResponseModel =
        editEducationResponseModelFromJson(response.body);
    return editEducationResponseModel;
  }
}
