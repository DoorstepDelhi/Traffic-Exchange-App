import 'package:ecommerce_app_ui_kit/services/api_services.dart';
import 'package:ecommerce_app_ui_kit/services/navigation_service.dart';
import 'package:ecommerce_app_ui_kit/view/login_viewmodel.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void setupLocator() {
  getIt.registerLazySingleton(() => NavigationService());
  getIt.registerFactory(() => ApiService());
  getIt.registerFactory(() => LogInViewModel());
}
