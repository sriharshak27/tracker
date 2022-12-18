import 'addition.dart';

class WorkoutDay {
  final String name;
  List<ExerciseAddition> today;

  WorkoutDay({
    required this.name,
    this.today = const []
  });
}