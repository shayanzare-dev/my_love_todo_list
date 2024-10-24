import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../shared/shayan_snack_bar.dart';
import '../models/edit_todo_dto.dart';
import '../models/edit_todo_view_model.dart';
import '../repositories/edit_todo_repository.dart';

class EditTodoController extends GetxController {
  final int? id;

  EditTodoController(this.id);

  final EditTodoRepository _repository = EditTodoRepository();
  final TextEditingController titleController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  RxBool isLoading = false.obs, isRetryMode = false.obs,isEditLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    if (id != null) {
      getTodoById(id: id!);
    }
  }

  Future<void> getTodoById({required int id}) async {
    Either<String, EditTodoViewModel> resultOrException =
        await _repository.getTodoById(id: id);
    isLoading.value = true;
    resultOrException.fold(
      (String exception) {
        isLoading.value = false;
        isRetryMode.value = true;
        shayanShowSnackBar(title: 'edit todo', message: exception);
      },
      (EditTodoViewModel todo) {
        isLoading.value = false;
        isRetryMode.value = false;
        titleController.text = todo.title;
      },
    );
  }

  Future<void> editTodo({required int id}) async {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }
    isEditLoading.value = true;
    final EditTodoDto editTodoDto =
        EditTodoDto(userId: 1, title: titleController.text, completed: true);
    Either<String, Map<String, dynamic>> editTodo =
        await _repository.editTodo(id: id, editTodoDto: editTodoDto);
    isEditLoading.value = false;
    editTodo.fold(
      (exception) => shayanShowSnackBar(title: 'edit todo', message: exception),
      (newTodo) => Get.back(result: newTodo),
    );
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
  }

  String? validate(String? value) {
    if (value?.isNotEmpty ?? false) {
      return null;
    } else {
      return 'required';
    }
  }
}
