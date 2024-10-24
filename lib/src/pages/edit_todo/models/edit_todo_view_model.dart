class EditTodoViewModel {
  final int id, userId;
  final String title;
  final bool completed;

  const EditTodoViewModel(
      {required this.id,
      required this.userId,
      required this.title,
      required this.completed});

  factory EditTodoViewModel.fromJson(final Map<String, dynamic> json) =>
      EditTodoViewModel(
        id: json['id'],
        userId: json['userId'],
        title: json['title'],
        completed: json['completed'],
      );
}
