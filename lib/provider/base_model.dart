import 'package:ecommerce_app_ui_kit/enum/view_state.dart';
import 'package:ecommerce_app_ui_kit/provider/getit.dart';
import 'package:ecommerce_app_ui_kit/services/navigation_service.dart';
import 'package:flutter/material.dart';

class BaseModel extends ChangeNotifier {
  final navigationService = getIt<NavigationService>();
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;
  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
