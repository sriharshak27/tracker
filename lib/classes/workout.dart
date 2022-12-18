import 'package:workout/classes/day_cycle.dart';

class Workout {
  final String name;
  Map<DateTime, WorkoutDay> activities;

  Workout({required this.name, this.activities = const {}});
}