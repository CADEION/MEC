import 'package:dio/dio.dart';
import 'package:mec_frontend/core/api/api.dart';
import 'package:mec_frontend/data/models/user_model.dart';

class UserRepository {
  Api api = Api();

  Future<UserModel> createAccount({required String email,required String password}) async {
    try {
      Response response = await api.sendRequest.post("user/createAccount");
      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
      return userModelFromJson(apiResponse.data);
    } catch (e) {
      rethrow;
    }
  }

  
  Future<UserModel> signIn({required String email,required String password}) async {
    try {
      Response response = await api.sendRequest.post("user/signIn");
      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
      return userModelFromJson(apiResponse.data);
    } catch (e) {
      rethrow;
    }
  }
}