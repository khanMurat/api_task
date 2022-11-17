import 'package:api_test_murat/core/extension/context_extension.dart';
import 'package:api_test_murat/models/exercise/exercise_model.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_size_constant.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key, required this.exerciseModel}) : super(key: key);

  final ExerciseModel exerciseModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.p20, vertical: Sizes.p10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(exerciseModel.name, style: context.textTheme.titleLarge),
                  gapHeight10,
                  Text("type: ${exerciseModel.type}",
                      style: context.textTheme.subtitle2),
                  Text("muscle: ${exerciseModel.muscle}",
                      style: context.textTheme.subtitle2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
