import 'package:ecommerce_app_ui_kit/constant/appconstant.dart';
import 'package:ecommerce_app_ui_kit/enum/view_state.dart';
import 'package:ecommerce_app_ui_kit/provider/base_model.dart';
import 'package:ecommerce_app_ui_kit/services/api_services.dart';
import 'package:ecommerce_app_ui_kit/services/prefs_services.dart';
import 'package:flutter/cupertino.dart';

class LogInViewModel extends BaseModel {
  ApiService _apiService = ApiService();
  Prefs _prefs = Prefs();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signUp(BuildContext context) async {
    setState(ViewState.Busy);
    final response = await _apiService.signupMethod({
      'email': emailController.text,
      'username': userNameController.text,
      'password1': passwordController.text,
      'password2': passwordController.text,
    });
    if (!response.error) {
      setState(ViewState.Idle);
      _prefs.setAuthToken(response.data['key']);
      _prefs.setUID(response.data['user'].toString());

      print('success');
      navigationService.navigateTo('/Tabs',
          arguments: 2, withreplacement: true);
    } else {
      setState(ViewState.Idle);
      AppConstant.showFailToast(context, response.errorMessage);
    }
  }

  void logIn(BuildContext context) async {
    setState(ViewState.Busy);
    final response = await _apiService.loginMethod({
      'email': emailController.text,
      'username': userNameController.text,
      'password': passwordController.text
    });
    if (!response.error) {
      setState(ViewState.Idle);
      _prefs.setAuthToken(response.data['key']);
      _prefs.setUID(response.data['user'].toString());
      print('success');
      navigationService.navigateTo('/Tabs',
          arguments: 2, withreplacement: true);
    } else {
      setState(ViewState.Idle);
      AppConstant.showFailToast(context, response.errorMessage);
    }
  }
}
