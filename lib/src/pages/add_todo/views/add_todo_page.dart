import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_love_todo_list/src/pages/add_todo/controllers/add_todo_controller.dart';

class AddTodoPage extends GetView<AddTodoController> {
  const AddTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: SafeArea(child: SafeArea(child: _body())),
    );
  }

  Widget _body() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: controller.formKey,
              child: TextFormField(
                controller: controller.titleController,
                validator: controller.validate,
                decoration: const InputDecoration(
                  hintText: 'title',
                ),
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
                        scale: 0.5,
                        child: const CircularProgressIndicator(),
                      ),
                    )
                  : ElevatedButton(
                      onPressed: controller.addTodo,
                      child: const Text('submit'),
                    ),
            ),
          ],
        ),
      );
}
