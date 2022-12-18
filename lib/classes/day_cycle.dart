import 'addition.dart';

class WorkoutDay {
  final String name;
  List<ExerciseAddition> exercises;

  WorkoutDay({
    required this.name,
    this.exercises = const []
  });

  void setExercises(List<ExerciseAddition> additions) {
    exercises = additions;
  }
  void addExercise(ExerciseAddition addition) {
    exercises.add(addition);
  }
  void removeExercise(ExerciseAddition exercise) {
    exercises.remove(exercise);
  }
}