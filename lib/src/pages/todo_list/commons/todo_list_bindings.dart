import 'package:get/get.dart';
import 'package:my_love_todo_list/src/pages/todo_list/controllers/todo_list_controller.dart';

class TodoListBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => TodoListController());
}
