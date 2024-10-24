import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_love_todo_list/src/pages/edit_todo/controllers/edit_todo_controller.dart';
import 'package:my_love_todo_list/src/pages/shared/shayan_refresh_progress_indicator.dart';

class EditTodoPage extends GetView<EditTodoController> {
  const EditTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(child: SafeArea(child: _body())),
    );
  }

  Widget _body() {
    if (controller.isLoading.value) {
      Center(child: shayanRefreshProgressIndicator());
    }
    return _editPage();
  }

  Widget _editPage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: controller.formKey,
            child: TextFormField(
              controller: controller.titleController,
              validator: controller.validate,
              decoration: const InputDecoration(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => controller.isLoading.value
                ? ElevatedButton(
                    onPressed: null,
                    child: Transform.scale(
                      scale: 0.7,
                      child: shayanRefreshProgressIndicator(),
                    ))
                : ElevatedButton(
                    onPressed: () => controller.editTodo(id: controller.id!),
                    child: const Text('edit')),
          ),
        ],
      ),
    );
  }
}
