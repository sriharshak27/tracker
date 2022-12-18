import 'day_cycle.dart';

class Workout { // workout plan
  final String name;
  Map<DateTime, WorkoutDay> activities;

  Workout({required this.name, this.activities = const {}});

  void addDay(DateTime dateTime, WorkoutDay day) {
    activities[dateTime] = day;
  }
  void removeDay(DateTime dateTime) {
    activities.remove(dateTime);
  }
}