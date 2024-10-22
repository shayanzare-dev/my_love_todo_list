class RepositoryUrls {
  RepositoryUrls._();

  static const String _baseUrl = 'jsonplaceholder.typicode.com';
  static const String _todos = '/todos';

  static final Uri getTodos = Uri.http(_baseUrl, _todos);
}
