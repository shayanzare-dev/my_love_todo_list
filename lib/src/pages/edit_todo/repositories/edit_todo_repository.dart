import 'dart:convert';
import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;

import '../../../infrastructure/commons/repository_urls.dart';
import '../../../infrastructure/utils/utils.dart';
import '../models/edit_todo_dto.dart';
import '../models/edit_todo_view_model.dart';

class EditTodoRepository {
  Future<Either<String, EditTodoViewModel>> getTodoById(
      {required int id}) async {
    try {
      final http.Response response =
          await http.get(RepositoryUrls.getTodoById(id: id));
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final EditTodoViewModel todo = EditTodoViewModel.fromJson(jsonData);
      return Right(todo);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, Map<String, dynamic>>> editTodo(
      {required final EditTodoDto editTodoDto, required final int id}) async {
    int? statusCode;
    try {
      final String body = json.encode(editTodoDto.toJson());
      final http.Response response = await http.patch(
        RepositoryUrls.editTodo(id: id),
        body: body,
        headers: Utils.header,
      );
      statusCode = response.statusCode;
      if (statusCode == 200) {
        final Map<String, dynamic> result = json.decode(response.body);
        return Right(result);
      } else {
        return Left('invalid , status code :$statusCode');
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
