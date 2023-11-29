class AddTask {
  final String name;
  bool isDone;

  AddTask({
    required this.name,
    this.isDone = false,
  });

  void toggleDone() {
    isDone = !isDone;
  }
}
