class RepositoryUrls {
  RepositoryUrls._();

  static const String _baseUrl = 'jsonplaceholder.typicode.com';
  static const String _todos = '/todos';

  static final Uri getTodos = Uri.https(_baseUrl, _todos);

  static Uri getTodoById({required int id}) =>
      Uri.https(_baseUrl, '$_todos/$id');

  static final Uri addTodo = Uri.https(_baseUrl, _todos);
}
