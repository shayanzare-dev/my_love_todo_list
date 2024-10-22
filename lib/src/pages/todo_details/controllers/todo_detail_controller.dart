import 'package:either_dart/either.dart';
import 'package:get/get.dart';

import '../../shared/shayan_snack_bar.dart';
import '../models/todo_list_view_model.dart';
import '../repositories/todo_list_repository.dart';

class TodoDetailController extends GetxController {
  final TodoListRepository _repository = TodoListRepository();
  RxList<TodoListViewModel> todos = RxList();
  RxBool isLoading = true.obs, isRetryMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    getTodos();
  }

  Future<void> getTodos() async {
    final Either<String, List<TodoListViewModel>> resultOrException =
        await _repository.getTodos();
    isLoading.value = true;
    resultOrException.fold((exception) {
      isLoading.value = false;
      isRetryMode.value = true;
      shayanShowSnackBar(title: 'todo list', message: exception);
    }, (todoList) {
      isLoading.value = false;
      isRetryMode.value = false;
      todos.value = todoList;
    });
  }
}