import 'exercise.dart';

class ExerciseAddition {
  final Exercise exercise;
  final int reps;
  final int sets;

  ExerciseAddition(
    {required this.exercise, required this.reps, required this.sets}
  );

  @override
  bool operator==(other) {
    // Dart ensures that operator== isn't called with null
    // if(other == null) {
    //   return false;
    // }
    if(other is! ExerciseAddition) {
      return false;
    }
    return exercise == (other).exercise;
  }
  
  @override
  int get hashCode => 1;
}