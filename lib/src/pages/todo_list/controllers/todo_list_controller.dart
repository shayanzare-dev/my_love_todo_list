import 'package:either_dart/either.dart';
import 'package:get/get.dart';

import '../../../infrastructure/route/route_names.dart';
import '../../shared/shayan_snack_bar.dart';
import '../models/todo_list_view_model.dart';
import '../repositories/todo_list_repository.dart';

class TodoListController extends GetxController {
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

  Future<void> deleteTodo({required int id}) async {
    final Either<String, bool> resultOrException =
        await _repository.deleteTodo(id: id);
    resultOrException.fold((exception) {
      shayanShowSnackBar(title: 'delete todo', message: exception);
    }, (right) {
      final int index = todos.indexWhere((todo) => todo.id == id);
      final bool isTodoFound = index != -1;
      if (isTodoFound) {
        todos.removeAt(index);
      }
    });
  }

  void goToDetailPage({required int id}) =>
      Get.toNamed(RouteNames.details, parameters: {'id': '$id'});

  Future<void> goToEditPage({required int id}) async {
    final result =
        await Get.toNamed(RouteNames.editTodo, parameters: {'id': '$id'});
    if (result != null && result is Map<String, dynamic>) {
      todos.add(TodoListViewModel.fromJson(result));
    }
  }

  Future<void> goToAddPage() async {
    final result = await Get.toNamed(RouteNames.addTodo);
    if (result != null) {
      final TodoListViewModel newTodo = TodoListViewModel.fromJson(result);
      todos.add(newTodo);
    }
  }
}
