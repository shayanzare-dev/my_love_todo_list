import 'dart:convert';
import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;

import '../../../infrastructure/commons/repository_urls.dart';
import '../models/todo_detail_view_model.dart';

class TodoListRepository {
  Future<Either<String, TodoListViewModel>> getTodoById(
      {required int id}) async {
    int? statusCode;
    try {
      final http.Response response =
          await http.get(RepositoryUrls.getTodoById(id: id));
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      final TodoListViewModel todos = TodoListViewModel.fromJson(jsonData);
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
}
