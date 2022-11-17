import 'package:api_test_murat/core/constants/app_size_constant.dart';
import 'package:api_test_murat/features/home/home_view.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.mapKey,
    required this.dropdownValue,
    required this.buttonTitle,
  });

  final String mapKey;
  final String? dropdownValue;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) =>
                      HomeView(queryParameters: {mapKey: dropdownValue})),
              (route) => false);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p60),
          child: Text(buttonTitle),
        ));
  }
}
