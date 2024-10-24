import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_love_todo_list/src/pages/shared/shayan_refresh_progress_indicator.dart';
import 'package:my_love_todo_list/src/pages/todo_list/controllers/todo_list_controller.dart';

import 'widgets/todo_item.dart';

class TodoListPage extends GetView<TodoListController> {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: controller.goToAddPage,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
    } else if (controller.todos.isEmpty) {
      return const Center(child: Text('empty todos'));
    } else {
      return _todoList();
    }
  }

  Widget _retry() => Center(
        child: FloatingActionButton(
          onPressed: controller.getTodos,
          child: const Icon(Icons.refresh_outlined),
        ),
      );

  Widget _todoList() => ListView.builder(
    itemCount: controller.todos.length,
        itemBuilder: (context, index) => TodoItem(
          todo: controller.todos[index],
          deleteOnTap: () =>
              controller.deleteTodo(id: controller.todos[index].id),
          detailsOnTap: () =>
              controller.goToDetailPage(id: controller.todos[index].id),
          editOnTap: () =>
              controller.goToEditPage(id: controller.todos[index].id),
        ),
      );
}
