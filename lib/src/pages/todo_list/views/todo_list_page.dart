import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_love_todo_list/src/pages/todo_list/controllers/todo_list_controller.dart';

class TodoListPage extends GetView<TodoListController> {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: SafeArea(child: _body())));
  }

  Widget _body() => Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Text(controller.todos[0].title),
          ],
        ),
      );
}
