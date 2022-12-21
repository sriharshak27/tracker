import 'day_cycle.dart';

class Workout { // workout plan
  late String name;
  Map<DateTime, WorkoutDay> activities = {};

  Workout.input({required this.name, this.activities = const {}});

  Workout.def() {
    name = 'Sample Chest Day';
    activities = { DateTime.now() :WorkoutDay.def()};
  }

  void addDay(DateTime dateTime, WorkoutDay day) {
    activities[dateTime] = day;
  }
  void removeDay(DateTime dateTime) {
    activities.remove(dateTime);
  }
}