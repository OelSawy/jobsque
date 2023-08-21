import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:jobsque/data/core/api_routes.dart';
import 'package:jobsque/data/models/favorites_models/delete_favorite_response_model.dart';
import 'package:jobsque/data/models/favorites_models/get_favorite_response_model.dart';

import '../../models/favorites_models/add_favorite_response_model.dart';

class FavoritesServices {
  Future<AddFavoriteResponseModel> addFavorite(
      String id, String jobId, String token) async {
    Response response = await http.post(Uri.parse(ApiRoutes.addFavorite),
        headers: {"Authorization": "Bearer $token"},
        body: {"user_id": id, "job_id": jobId});
    AddFavoriteResponseModel addFavoriteResponseModel =
        addFavoriteResponseModelFromJson(response.body);
    return addFavoriteResponseModel;
  }

  Future<GetFavoriteResponseModel> getFavorite(String id, String token) async {
    Response response = await http.get(
        Uri.parse("${ApiRoutes.getFavorite}/$id"),
        headers: {"Authorization": "Bearer $token"});
    GetFavoriteResponseModel getFavoriteResponseModel;
    if (response.statusCode == 200) {
      getFavoriteResponseModel = getFavoriteResponseModelApprovedFromJson(response.body);
    } else {
      getFavoriteResponseModel = getFavoriteResponseModelDeniedFromJson(response.body);
    }
    return getFavoriteResponseModel;
  }

  Future<DeleteFavoriteResponseModel> deleteFavorite(
      String favoriteId, String token) async {
    Response response = await http.delete(
        Uri.parse("${ApiRoutes.deleteFavorite}/$favoriteId"),
        headers: {"Authorization": "Bearer $token"});
    DeleteFavoriteResponseModel deleteFavoriteResponseModel =
        deleteFavoriteResponseModelFromJson(response.body);
    return deleteFavoriteResponseModel;
  }
}
