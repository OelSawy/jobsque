import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:jobsque/data/core/api_routes.dart';

import 'package:jobsque/data/models/auth_models/login_response_model.dart';

class LoginServices {
  Future<LoginResponseModel> login(String email, String password) async {
    Response response = await http.post(Uri.parse(ApiRoutes.login),
        body: {"email": email, "password": password});
    LoginResponseModel loginResponseModel =
        loginResponseModelFromJson(response.body);
    return loginResponseModel;
  }
}
