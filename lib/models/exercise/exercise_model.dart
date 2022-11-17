class ExerciseModel {
  String name;
  String type;
  String muscle;

  ExerciseModel({
    required this.name,
    required this.type,
    required this.muscle,
  });

  factory ExerciseModel.fromMap(Map<String, dynamic> map) {
    return ExerciseModel(
      name: map["name"] as String,
      type: map["type"] as String,
      muscle: map["muscle"] as String,
    );
  }
}
