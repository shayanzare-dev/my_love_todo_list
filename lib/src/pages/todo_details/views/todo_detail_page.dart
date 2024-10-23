import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_love_todo_list/src/pages/shared/shayan_refresh_progress_indicator.dart';
import 'package:my_love_todo_list/src/pages/todo_details/controllers/todo_detail_controller.dart';

class TodoDetailPage extends GetView<TodoDetailController> {
  const TodoDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.redAccent,
        title: const Text('todo detail',),
      ),
      body: SafeArea(child: SafeArea(child: Obx(() => _body()))),
    );
  }

  Widget _body() {
    if (controller.isLoading.value) {
      return Center(
        child: shayanRefreshProgressIndicator(),
      );
    } else if (controller.isRetryMode.value) {
      return Center(
        child: _retry(),
      );
    } else {
      return Center(
        child: Column(
          children: [
            Text(controller.todo.value!.title),
            Text(controller.todo.value!.completed.toString()),
          ],
        ),
      );
    }
  }

  Widget _retry() => Center(
        child: FloatingActionButton(
          onPressed: () => controller.getTodoById(id: controller.id!),
          child: const Icon(Icons.refresh_outlined),
        ),
      );
}
