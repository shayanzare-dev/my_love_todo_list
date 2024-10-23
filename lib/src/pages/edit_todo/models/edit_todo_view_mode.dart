class EditTodoViewMode {
  final int id, userId;
  final String title;
  final bool completed;

  const EditTodoViewMode(
      {required this.id,
      required this.userId,
      required this.title,
      required this.completed});

  factory EditTodoViewMode.fromJson(final Map<String, dynamic> json) =>
      EditTodoViewMode(
        id: json['id'],
        userId: json['userId'],
        title: json['title'],
        completed: json['completed'],
      );
}
