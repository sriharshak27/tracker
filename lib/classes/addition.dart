import 'exercise.dart';

class ExerciseAddition {
  late Exercise exercise;
  late int reps;
  late int sets;

  ExerciseAddition.inputs(
    {required this.exercise, required this.reps, required this.sets}
  );

  ExerciseAddition.def() {
    exercise = Exercise.def();
    reps = 10;
    sets = 3;
  }


  @override
  bool operator==(other) {
    if(other is! ExerciseAddition) {
      return false;
    }
    return exercise == (other).exercise;
  }

  @override
  int get hashCode => 1;

  Map<String, dynamic> toJson() {
    return {
      'addition_name': exercise.toJson(),
      'reps': reps,
      'sets': sets,
    };
  }
}