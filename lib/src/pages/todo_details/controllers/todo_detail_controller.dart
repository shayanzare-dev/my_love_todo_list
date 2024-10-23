import 'package:either_dart/either.dart';
import 'package:get/get.dart';

import '../../shared/shayan_snack_bar.dart';
import '../models/todo_detail_view_model.dart';
import '../repositories/todo_list_repository.dart';

class TodoDetailController extends GetxController {
  final int? id;

  TodoDetailController(this.id);

  final TodoListRepository _repository = TodoListRepository();
  final Rxn<TodoListViewModel> todo = Rxn();
  final RxBool isLoading = true.obs, isRetryMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    if (id != null) {
      getTodoById(id: id!);
    }
  }

  Future<void> getTodoById({required int id}) async {
    final Either<String, TodoListViewModel> resultOrException =
        await _repository.getTodoById(id: id);
    isLoading.value = true;
    resultOrException.fold((exception) {
      isLoading.value = false;
      isRetryMode.value = true;
      shayanShowSnackBar(title: 'todo details', message: exception);
    }, (todoView) {
      isLoading.value = false;
      isRetryMode.value = false;
      todo.value = todoView;
    });
  }
}
