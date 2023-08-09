import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:jobsque/data/core/api_routes.dart';
import 'package:jobsque/data/models/experience_models/add_experience_response_model.dart';
import 'package:jobsque/data/models/experience_models/end_experience_response_model.dart';

class ExperienceServices {
  Future<AddExperienceResponseModel> addExperience(
      String id,
      String position,
      String workType,
      String companyName,
      String location,
      String start,
      String token) async {
    Response response =
        await http.post(Uri.parse(ApiRoutes.addExperience), headers: {
      "Authorization": "Bearer $token"
    }, body: {
      "user_id": id,
      "position": position,
      "type_work": workType,
      "comp_name": companyName,
      "location": location,
      "start": start
    });
    AddExperienceResponseModel addExperienceResponseModel =
        addExperienceResponseModelFromJson(response.body);
    return addExperienceResponseModel;
  }

  Future<EndExperienceResponseModel> endExperience(
      String experienceId, String token) async {
    Response response = await http.put(
        Uri.parse("${ApiRoutes.endExperience}/$experienceId"),
        headers: {"Authorization": "Bearer $token"});
    EndExperienceResponseModel endExperienceResponseModel =
        endExperienceResponseModelFromJson(response.body);
    return endExperienceResponseModel;
  }
}
