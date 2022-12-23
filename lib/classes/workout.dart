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

  // List process() {
  //   List ret = [];
  //   activities.forEach((key, value) {
  //     ret.add({
  //       "${key.month}/${key.day}/${key.month}" : value.toJson()
  //     });
  //   });
  //   return ret;
  // }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> ret = {};
    ret['workout_name'] = name;
    activities.forEach((key, value) {
      ret["${key.month}/${key.day}/${key.month}"] = value.toJson();
    });
    return ret;
  }
}