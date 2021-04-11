import 'package:ecommerce_app_ui_kit/services/api-response.dart';
import 'package:ecommerce_app_ui_kit/services/api_urls.dart';
import 'package:ecommerce_app_ui_kit/services/base_api.dart';

class ApiService extends BaseApi {
  Future<ApiResponse> signupMethod(data) async {
    ApiResponse response;
    try {
      response = await signUp(data, eSignUp);
    } catch (e) {
      response = ApiResponse(error: true, errorMessage: e.toString());
    }

    return response;
  }

  Future<ApiResponse> loginMethod(data) async {
    ApiResponse response;
    try {
      response = await signUp(data, eLogIn);
      print('no error');
    } catch (e) {
      response = ApiResponse(error: true, errorMessage: e.toString());
    }

    return response;
  }
}
