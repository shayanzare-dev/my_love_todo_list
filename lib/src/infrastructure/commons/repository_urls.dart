class RepositoryUrls {
  RepositoryUrls._();

  static const String _baseUrl = 'localhost:3000';
  static const String _todos = '/todos';

  static final Uri getTodos = Uri.http(_baseUrl, _todos);

  static Uri getTodoById({required int id}) =>
      Uri.http(_baseUrl, '$_todos/$id');

  static final Uri addTodo = Uri.http(_baseUrl, _todos);

  static Uri editTodo({required int id}) => Uri.http(_baseUrl, '$_todos/$id');
  static Uri removeTodo({required int id}) => Uri.http(_baseUrl, '$_todos/$id');
}
