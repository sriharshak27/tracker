import 'addition.dart';

class WorkoutDay {
  late String name;
  List<ExerciseAddition> exercises = [];

  WorkoutDay.inputs({
    required this.name,
    this.exercises = const []
  });

  WorkoutDay.def() {
    name = 'Sample full body';
    exercises.add(ExerciseAddition.def());
  }

  void setExercises(List<ExerciseAddition> additions) {
    exercises = additions;
  }
  void addExercise(ExerciseAddition addition) {
    exercises.add(addition);
  }
  void removeExercise(ExerciseAddition exercise) {
    exercises.remove(exercise);
  }

  List process() {
    List ret = [];
    for(int i = 0; i < exercises.length; i++){
      ret.add(exercises[i].toJson());
    }
    return ret;
  }

  Map<String, dynamic> toJson(){
    return {
      'day_name': name,
      'exercises': process()
    };
  }
}