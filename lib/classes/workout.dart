import 'date_proc.dart';
import 'day_cycle.dart';

class Workout { // workout plan
  late String name;
  Map<String, WorkoutDay> activities = {};

  Workout.input({required this.name, this.activities = const {}});

  Workout.def() {
    name = 'Sample Chest Day';
    activities = {ProcessDates.dateToString(DateTime.now()) : WorkoutDay.def()};
  }

  void addDay(DateTime dateTime, WorkoutDay day) {
    activities[ProcessDates.dateToString(dateTime)] = day;
  }
  void removeDay(DateTime dateTime) {
    activities.remove(ProcessDates.dateToString(dateTime));
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> tmp = activities;
    tmp['workout_name'] = name;
    return tmp;
  }
}