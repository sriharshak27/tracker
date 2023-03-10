class Exercise {
  late final String name;
  late Map<DateTime, int> history;
  
  Exercise.inputs({required this.name, this.history = const {}});
  Exercise.def(){
    name = "Example: Bench";
    history = const {};
  }

  void addRecord(DateTime dateTime, int weight) {
    history[dateTime] = weight;
  }

  @override
  bool operator==(other) {
    if(other is! Exercise) {
      return false;
    }
    return name == (other).name;
  }
  
  @override
  int get hashCode => 1;

  List process() {
    List ret = [];
    history.forEach((key, value) {
      ret.add({
        "${key.month}/${key.day}/${key.month}" : value
      });
    });
    return ret;
  }

  Map<String, dynamic>  toJson() {
    return {
      'exercise_name': name,
      'history': process()
    };
  }
}