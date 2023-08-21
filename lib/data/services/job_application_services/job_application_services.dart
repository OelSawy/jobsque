import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:jobsque/data/core/api_routes.dart';
import 'package:jobsque/data/models/job_application_models/get_applied_jobs_response_model.dart';

class JobApplicationServices {
  Future<GetAppliedJobsResponseModel> getAppliedJobs(String id, String token) async {
    Response response = await http.get(Uri.parse("${ApiRoutes.getAppliedJobs}/$id"), headers: {"Authorization": "Bearer $token"});
    GetAppliedJobsResponseModel getAppliedJobsResponseModel = getAppliedJobsResponseModelFromJson(response.body);
    return getAppliedJobsResponseModel;
  }
}