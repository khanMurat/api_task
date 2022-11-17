import 'package:api_test_murat/core/init/navigation/navigation_constant.dart';
import 'package:api_test_murat/features/category/category_view.dart';
import 'package:api_test_murat/features/home/home_view.dart';
import 'package:flutter/material.dart';

class NavigationManager {
  NavigationManager._init();

  static final NavigationManager _instance = NavigationManager._init();
  static NavigationManager get instance => _instance;

  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationConstant.home:
        return pageRoute(
          NavigationConstant.home,
          HomeView(queryParameters: settings.arguments as Map<String, dynamic>),
        );
      case NavigationConstant.category:
        return pageRoute(NavigationConstant.home, const CategoryView());
    }
    return null;
  }

  MaterialPageRoute pageRoute(String routeName, Widget view, {Object? data}) {
    return MaterialPageRoute(
      builder: ((context) => view),
      settings: RouteSettings(name: routeName, arguments: data),
    );
  }
}
