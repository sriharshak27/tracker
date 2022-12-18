class Exercise {
  final String name;
  Map<DateTime, int> history;
  
  Exercise({required this.name, this.history = const {}});

  void addRecord(DateTime dateTime, int weight) {
    history[dateTime] = weight;
  }

  @override
  bool operator==(other) {
    // Dart ensures that operator== isn't called with null
    // if(other == null) {
    //   return false;
    // }
    if(other is! Exercise) {
      return false;
    }
    return name == (other).name;
  }
  
  @override
  int get hashCode => 1;
}