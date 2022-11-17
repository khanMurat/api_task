import 'dart:async';
import 'dart:io';
import 'package:api_test_murat/core/base/base_view_model.dart';
import 'package:api_test_murat/models/exercise/exercise_model.dart';
import 'package:flutter/material.dart';
import 'home_service.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel._init();
  static final HomeViewModel _instance = HomeViewModel._init();
  static HomeViewModel get instance => _instance;

  final _service = HomeService();

  @override
  void setContext(BuildContext context) => this.context = context;

  List<ExerciseModel> exerciseList = [];

  bool isLoading = true;

  String query = "";

  Timer? bouncer;

  void _setTrue() {
    isLoading = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  void _setFalse() {
    isLoading = false;
    notifyListeners();
  }

  void getExerciseList(
      {String? query, Map<String, dynamic>? queryParamters}) async {
    _setTrue();

    try {
      exerciseList = (await _service.getExerciseInfoList(
          query: query, queryParamters: queryParamters));
    } on HttpException catch (e) {
      ScaffoldMessenger.of(context!)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
    _setFalse();
  }

  void bounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (bouncer != null) {
      bouncer!.cancel();
    }
    bouncer = Timer(duration, callback);
  }

  Future searchExercise(
    String query,
  ) async =>
      bounce(() async {
        final exercise = await _service.getExerciseInfoList(query: query);

        this.query = query;
        exerciseList = exercise;

        notifyListeners();
      });
}
