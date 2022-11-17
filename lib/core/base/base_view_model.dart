import 'package:api_test_murat/core/init/navigation/navigation_service.dart';
import 'package:flutter/material.dart';

abstract class BaseViewModel extends ChangeNotifier {
  BuildContext? context;

  NavigationService navigationService = NavigationService.instance;

  void setContext(BuildContext context);
}
