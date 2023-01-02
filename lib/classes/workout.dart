import 'date_proc.dart';
import 'day_cycle.dart';

class Workout { // workout plan
  late String name;
  Map<String, WorkoutDay> activities = {};

  Workout.input({required this.name, this.activities = const {}});

  Workout.def() {
    name = 'Sample PPL';
    activities = {ProcessDates.dateToString(DateTime.now()) : WorkoutDay.def()};
  }

  void addDay(DateTime dateTime, WorkoutDay day) {
    activities[ProcessDates.dateToString(dateTime)] = day;
  }
  void removeDay(DateTime dateTime) {
    activities.remove(ProcessDates.dateToString(dateTime));
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> tmp = {};
    tmp['workout_name'] = name;
    activities.forEach((key, value) {
      tmp[key] = value.toJson();
    });
    return tmp;
  }
}