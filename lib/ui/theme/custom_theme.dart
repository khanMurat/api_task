import 'package:api_test_murat/core/constants/color_kit.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  CustomTheme._init();
  static final CustomTheme _instance = CustomTheme._init();
  static CustomTheme get instance => _instance;

  ThemeData cTheme = ThemeData(
    scaffoldBackgroundColor: ColorKit.whiteColor,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorKit.grey400,
      elevation: 1,
      titleTextStyle: const TextStyle(
        fontSize: 20,
        color: ColorKit.whiteColor,
        fontWeight: FontWeight.w500,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        onPrimary: ColorKit.whiteColor,
        primary: ColorKit.blackColor,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorKit.whiteColor,
    ),
  );
}
