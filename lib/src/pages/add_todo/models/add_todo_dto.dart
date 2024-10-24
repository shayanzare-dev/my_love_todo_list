class AddTodoDto {
  final int userId;
  final String title;
  final bool completed;

  const AddTodoDto(
      {required this.userId, required this.title, required this.completed});

  Map<String, dynamic> toJson() =>
      {"userId": userId, "title": title, "completed": completed};
}
