import 'package:flutter/material.dart';

import '../../models/todo_list_view_model.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key, required this.todo, required this.onTap});

  final TodoListViewModel todo;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        hoverColor: Colors.red.withOpacity(0.5),
        onTap: onTap,
        child: Container(
          color: Colors.blue.shade200,
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  todo.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
