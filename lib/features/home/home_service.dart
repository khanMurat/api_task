import 'package:api_test_murat/models/exercise/exercise_model.dart';

import '../../core/init/network/network_manager.dart';

class HomeService {
  final _networkManager = NetworkManager.instance;

  Future<List<ExerciseModel>> getExerciseInfoList(
      {String? query, Map<String, dynamic>? queryParamters}) async {
    try {
      final data = await _networkManager.getData(
          query: query, queryParameters: queryParamters);

      final list = List<Map<String, dynamic>>.from(data);

      var exerciseList = list.map(ExerciseModel.fromMap).where((exercise) {
        final nameLower = exercise.name.toLowerCase();
        final typeLower = exercise.type.toLowerCase();
        final muscleLower = exercise.muscle.toLowerCase();
        final searchLower = query!.toLowerCase();

        return nameLower.contains(searchLower) ||
            typeLower.contains(searchLower) ||
            muscleLower.contains(searchLower);
      }).toList();

      return exerciseList;
    } on Exception {
      rethrow;
    }
  }
}
