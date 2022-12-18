class Exercise {
  final String name;
  List<Map<DateTime, int>> history = [];
  
  Exercise({required this.name, this.history = const []});
}