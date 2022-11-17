import 'package:api_test_murat/core/init/navigation/navigation_manager.dart';
import 'package:api_test_murat/core/init/navigation/navigation_service.dart';
import 'package:api_test_murat/features/home/home_view.dart';
import 'package:api_test_murat/features/home/home_view_model.dart';
import 'package:api_test_murat/ui/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel.instance,
      builder: (context, child) {
        return MaterialApp(
          theme: CustomTheme.instance.cTheme,
          debugShowCheckedModeBanner: false,
          navigatorKey: NavigationService.instance.navigatorKey,
          onGenerateRoute: NavigationManager.instance.generateRoute,
          home: const HomeView(),
        );
      },
    );
  }
}
