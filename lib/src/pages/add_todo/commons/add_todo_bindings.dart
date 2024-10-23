import 'package:get/get.dart';

import '../controllers/add_todo_controller.dart';

class AddTodoBindings extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => AddTodoController());
}
