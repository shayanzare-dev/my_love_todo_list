import 'dart:convert';
import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;

import '../../../infrastructure/commons/repository_urls.dart';
import '../models/todo_list_view_model.dart';

class TodoListRepository {
  Future<Either<String, List<TodoListViewModel>>> getTodos() async {
    int? statusCode;
    try {
      final http.Response response = await http.get(RepositoryUrls.getTodos);
      final List<dynamic> jsonData = jsonDecode(response.body);
      final List<TodoListViewModel> todos = castData(jsonData);
      statusCode = response.statusCode;
      return Right(todos);
    } on SocketException {
      return const Left('there is\'nt connect to the internet');
    } on HttpException {
      return const Left('error for send request to server');
    } on FormatException {
      return const Left('received invalid response from the internet');
    } catch (e) {
      return Left(
          'something went wrong status code: $statusCode , error-> ${e.toString()}');
    }
  }

  List<TodoListViewModel> castData(List<dynamic> jsonData) =>
      jsonData.map((todo) => TodoListViewModel.fromJson(todo)).toList();

  Future<Either<String, bool>> deleteTodo({required final int id}) async {
    int? statusCode;
    try {
      final http.Response response =
          await http.delete(RepositoryUrls.removeTodo(id: id));
      statusCode = response.statusCode;
      print('response => ${response.body}');
      if (statusCode == 200) {
        return const Right(true);
      } else {
        return Left('error with $statusCode code');
      }
    } on SocketException {
      return const Left('there is\'nt connect to the internet');
    } on HttpException {
      return const Left('error for send request to server');
    } on FormatException {
      return const Left('received invalid response from the internet');
    } catch (e) {
      return Left(
          'something went wrong status code: $statusCode , error-> ${e.toString()}');
    }
  }
}
