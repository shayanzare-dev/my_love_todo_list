import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_love_todo_list/src/pages/add_todo/models/todo_dto.dart';
import 'package:my_love_todo_list/src/pages/shared/shayan_snack_bar.dart';

import '../repositories/add_todo_repository.dart';

class AddTodoController extends GetxController {
  final AddTodoRepository _repository = AddTodoRepository();
  final TextEditingController titleController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    addTodo();
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
  }

  String? validate(String? value) {
    if (value?.isNotEmpty ?? false) {
      return null;
    }
    return 'required';
  }

  //
  // Future<void> getTodos() async {
  //   final Either<String, List<TodoListViewModel>> resultOrException =
  //       await _repository.getTodos();
  //   isLoading.value = true;
  //   resultOrException.fold((exception) {
  //     isLoading.value = false;
  //     isRetryMode.value = true;
  //     shayanShowSnackBar(title: 'todo list', message: exception);
  //   }, (todoList) {
  //     isLoading.value = false;
  //     isRetryMode.value = false;
  //     todos.value = todoList;
  //   });
  // }

  Future<void> addTodo() async {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }
    final TodoDto todoDto =
        TodoDto(userId: 1, title: titleController.text, completed: true);
    final Either<String, Map<String, dynamic>> resultOrException =
        await _repository.addTodo(todoDto: todoDto);
    isLoading.value = true;
    resultOrException.fold((exception) {
      isLoading.value = true;
      shayanShowSnackBar(title: 'add todo', message: exception);
    }, (Map<String, dynamic> todoDto) {
      isLoading.value = false;
      Get.back(result: todoDto);
    });
  }
}
