import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;

import '../../../infrastructure/commons/repository_urls.dart';
import '../models/todo_list_view_model.dart';

class TodoListRepository {
  Future<Either<String, List<TodoListViewModel>>> getTodos() async {
    try {
      final http.Response response = await http.get(RepositoryUrls.getTodos);
      final List<dynamic> jsonData = jsonDecode(response.body);
      final List<TodoListViewModel> todos =
          jsonData.map((todo) => TodoListViewModel.fromJson(todo)).toList();
      return Right(todos);
    } catch (e) {
      return Left('error text -> ${e.toString()}');
    }
  }
}
