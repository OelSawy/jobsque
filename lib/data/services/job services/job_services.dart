import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:jobsque/data/core/api_routes.dart';
import 'package:jobsque/data/models/job%20models/show_jobs_response_model.dart';
import 'package:jobsque/data/models/job%20models/show_suggested_jobs_response_model.dart';

class JobServices {
  Future<ShowJobsResponseModel> getJobs(String token) async {
    Response response = await http.get(Uri.parse(ApiRoutes.showJobs), headers: {"Authorization" : "Bearer $token"});
    ShowJobsResponseModel showJobsResponseModel = showJobsResponseModelFromJson(response.body);
    return showJobsResponseModel;
  }

  Future<ShowSuggestedJobsResponseModel> showSuggestedJobs(String id, String token) async {
    Response response = await http.get(Uri.parse("${ApiRoutes.showSuggestedJobs}/$id"), headers: {"Authorization" : "Bearer $token"});
    ShowSuggestedJobsResponseModel showSuggestedJobsResponseModel = showSuggestedJobsResponseModelFromJson(response.body);
    return showSuggestedJobsResponseModel;
  }

  // TODO : Search and filter "ask for"
}