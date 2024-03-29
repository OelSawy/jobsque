import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:jobsque/data/core/api_routes.dart';
import 'package:jobsque/data/models/auth_models/register_response_model.dart';

class RegisterServices {
  Future<RegisterResponseModel> createAccount(
      String name, String email, String password) async {
    Response response = await http.post(Uri.parse(ApiRoutes.register),
        body: {"name": name, "email": email, "password": password});
    if (response.statusCode == 200) {
      return registerResponseModelApprovedFromJson(response.body);
    } else {
      return registerResponseModelDeniedFromJson(response.body);
    }
  }
}
