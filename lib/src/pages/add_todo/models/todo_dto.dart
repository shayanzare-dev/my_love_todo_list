class TodoDto {
  final int userId;
  final String title;
  final bool completed;

  const TodoDto(
      {required this.userId, required this.title, required this.completed});

  Map<String, dynamic> toJson() =>
      {"userId": userId, "title": title, "completed": completed};
}
