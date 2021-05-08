import 'package:ecommerce_app_ui_kit/constant/appconstant.dart';
import 'package:ecommerce_app_ui_kit/enum/view_state.dart';
import 'package:ecommerce_app_ui_kit/provider/base_model.dart';
import 'package:ecommerce_app_ui_kit/services/api_services.dart';
import 'package:ecommerce_app_ui_kit/src/models/website.dart';
import 'package:flutter/material.dart';

class WebsiteViewModel extends BaseModel {
  TextEditingController nameController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  TextEditingController timerController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dailyHitsController = TextEditingController();
  TextEditingController totalHitsController = TextEditingController();
  TextEditingController trafficController = TextEditingController();
  ApiService _apiService = ApiService();

  void addWebsite(BuildContext context) async {
    Website website = Website();
    website.name = nameController.text;
    website.url = urlController.text;
    website.dailyHits = int.parse(dailyHitsController.text);
    website.totalHits = int.parse(totalHitsController.text);
    website.category =
        categoryController.text != "" ? categoryController.text : 'S';
    website.trafficSource =
        trafficController.text != "" ? trafficController.text : 'D';

    var data = website.toJson();
    print(data);

    setState(ViewState.Busy);
    final response =
        await _apiService.postRequest('/webtraffic/websites/', data);
    if (!response.error) {
      setState(ViewState.Idle);
      print('success');
      navigationService.navigateTo('/Tabs',
          arguments: 0, withreplacement: true);
    } else {
      setState(ViewState.Idle);
      print(response.data);
      print(response.errorMessage);
      AppConstant.showFailToast(context, response.errorMessage);
    }
  }
}
