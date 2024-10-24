import 'package:flutter/material.dart';

import '../../models/todo_list_view_model.dart';

class TodoItem extends StatelessWidget {
  const TodoItem(
      {super.key,
      required this.todo,
      required this.detailsOnTap,
      required this.editOnTap,
      required this.deleteOnTap});

  final TodoListViewModel todo;
  final void Function() detailsOnTap;
  final void Function() editOnTap;
  final void Function() deleteOnTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
            TextButton(
              onPressed: detailsOnTap,
              child: const Text(
                'details page',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            TextButton(
              onPressed: editOnTap,
              child: const Text(
                'edit page',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            TextButton(
              onPressed: deleteOnTap,
              child: const Text(
                'delete item',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
