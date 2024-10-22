class TodoListViewModel {
  final int id, userId;
  final String title;
  final bool completed;

  const TodoListViewModel(
      {required this.id,
      required this.userId,
      required this.title,
      required this.completed});

  factory TodoListViewModel.fromJson(final Map<String, dynamic> json) =>
      TodoListViewModel(
        id: json['id'],
        userId: json['userId'],
        title: json['title'],
        completed: json['completed'],
      );
}
