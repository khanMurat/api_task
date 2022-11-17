import 'package:api_test_murat/core/base/base_view_model.dart';
import 'package:flutter/material.dart';

class CategoryViewModel extends BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  List<String> typeList = [
    "cardio",
    "olympic_weightlifting",
    "plyometrics",
    "powerlifting",
    "strength",
    "stretching",
    "strongman"
  ];
  List<String> muscleList = [
    "abdominals",
    "abductors",
    "adductors",
    "biceps",
    "calves",
    "chest",
    "forearms",
    "glutes",
    "hamstrings",
    "lats",
    "lowerback middleback",
    "neck",
    "quadriceps",
    "traps",
    "triceps",
  ];
}
