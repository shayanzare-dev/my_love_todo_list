import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_love_todo_list/src/pages/shared/shayan_refresh_progress_indicator.dart';
import 'package:my_love_todo_list/src/pages/todo_details/controllers/todo_detail_controller.dart';

class TodoDetailPage extends GetView<TodoDetailController> {
  const TodoDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SafeArea(child: _body())),
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
      return Text('test');
    }
  }

  Widget _retry() => Center(
    child: FloatingActionButton(
      onPressed: controller.getTodos,
      child: const Icon(Icons.refresh_outlined),
    ),
  );
}
