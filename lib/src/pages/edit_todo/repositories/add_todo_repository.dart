import 'dart:convert';
import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import 'package:my_love_todo_list/src/infrastructure/utils/utils.dart';

import '../../../infrastructure/commons/repository_urls.dart';
import '../models/edit_todo_dto.dart';

class AddTodoRepository {
  Future<Either<String, Map<String, dynamic>>> addTodo(
      {required final TodoDto todoDto}) async {
    int? statusCode;
    try {
      final String body = jsonEncode(todoDto.toJson());
      final http.Response response = await http.post(
        RepositoryUrls.addTodo,
        body: body,
        headers: Utils.header,
      );
      statusCode = response.statusCode;
      return Right(json.decode(response.body));
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
