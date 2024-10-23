import 'package:get/get.dart';

import '../controllers/todo_detail_controller.dart';

class TodoDetailBinding extends Bindings {
  @override
  void dependencies() {
    final int? id = int.tryParse(Get.parameters['id'] ?? '');
    Get.lazyPut(() => TodoDetailController(id));
  }
}
