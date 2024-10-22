import 'package:either_dart/either.dart';
import 'package:get/get.dart';

import '../../shared/shayan_snack_bar.dart';
import '../models/todo_list_view_model.dart';
import '../repositories/todo_list_repository.dart';

class TodoListController extends GetxController {
  final TodoListRepository _repository = TodoListRepository();
  RxList<TodoListViewModel> todos = RxList();

  @override
  void onInit() {
    super.onInit();
    getTodos();
  }

  Future<void> getTodos() async {
    final Either<String, List<TodoListViewModel>> resultOrException =
        await _repository.getTodos();
    resultOrException.fold(
        (exception) => shayanShowSnackBar(title: 'todo list', message: 'error'),
        (todoList) => todos.value = todoList);
  }
}
