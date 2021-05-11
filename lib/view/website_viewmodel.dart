import 'package:ecommerce_app_ui_kit/constant/appconstant.dart';
import 'package:ecommerce_app_ui_kit/enum/view_state.dart';
import 'package:ecommerce_app_ui_kit/provider/base_model.dart';
import 'package:ecommerce_app_ui_kit/services/api_services.dart';
import 'package:ecommerce_app_ui_kit/src/models/website.dart';
import 'package:flutter/material.dart';

class WebsiteViewModel extends BaseModel {
  List<Website> initData = [];
  List<Website> checkedWebsite = [];

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
    final response = await _apiService.postWebsiteMethod(
        endpoint: '/webtraffic/websites/', data: data);
    if (!response.error) {
      setState(ViewState.Idle);
      print('success');
      navigationService.navigateTo('/Tabs',
          arguments: 1, withreplacement: true);
    } else {
      setState(ViewState.Idle);
      print(response.data);
      print(response.errorMessage);
      AppConstant.showFailToast(context, response.errorMessage);
    }
  }

  void getWebsites(BuildContext context) async {
    setState(ViewState.Busy);
    final response =
        await _apiService.getWebsiteMethod(endpoint: '/webtraffic/websites/');
    if (!response.error) {
      setState(ViewState.Idle);
      print(response.data);
      for (var res in response.data) {
        final web = websiteFromJson(res);
        initData.add(web);
        print(checkedWebsite);
      }
    } else {
      setState(ViewState.Idle);
      print(response.data);
      print(response.errorMessage);
      AppConstant.showFailToast(context, response.errorMessage);
    }
  }

  void deleteWebsite(BuildContext context, String id) async {
    print(id);
    setState(ViewState.Busy);
    final response = await _apiService.deleteWebsiteMethod(
        endpoint: '/webtraffic/websites', id: id);
    if (!response.error) {
      print('====================================');
      setState(ViewState.Idle);
      print(response.data);
    } else {
      setState(ViewState.Idle);
      print(response.data);
      print(response.errorMessage);
      AppConstant.showFailToast(context, response.errorMessage);
      navigationService.navigateTo('/Tabs',
          arguments: 1, withreplacement: true);
    }
  }

  void updateWebsite(BuildContext context, Website web, String id) async {
    var data = web.toJson();
    print(data);
    setState(ViewState.Busy);
    final response = await _apiService.patchWebsiteMethod(
        endpoint: '/webtraffic/website/$id/', data: data);
    if (!response.error) {
      print('====================================');
      setState(ViewState.Idle);
      print(response.data);
    } else {
      setState(ViewState.Idle);
      print(response.data);
      print(response.errorMessage);
      AppConstant.showFailToast(context, response.errorMessage);
      navigationService.navigateTo('/Tabs',
          arguments: 1, withreplacement: true);
    }
  }

  void deleteSelectedWebsite(BuildContext context) async {
    for (Website web in checkedWebsite) {
      deleteWebsite(context, web.id);
    }
  }

  void pauseSelectedWebsite(BuildContext context) {
    for (Website web in checkedWebsite) {
      print(web.id);
      web.name = "change";
      updateWebsite(context, web, web.id);
    }
  }
}
