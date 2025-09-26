class Task {
  final String title;
  final bool isDone;

  Task({required this.title, this.isDone = false});

  Task copyWith({String? title, bool? isDone}) {
    return Task(title: title ?? this.title, isDone: isDone ?? this.isDone);
  }
}
