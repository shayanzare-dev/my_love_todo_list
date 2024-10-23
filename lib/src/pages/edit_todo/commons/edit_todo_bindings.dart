import 'package:get/get.dart';

import '../controllers/edit_todo_controller.dart';

class EditTodoBindings extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => EditTodoController());
}
