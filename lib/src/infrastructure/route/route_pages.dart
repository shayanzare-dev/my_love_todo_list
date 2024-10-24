import 'package:get/get.dart';
import 'package:my_love_todo_list/src/pages/add_todo/views/add_todo_page.dart';

import '../../pages/add_todo/commons/add_todo_bindings.dart';
import '../../pages/edit_todo/commons/edit_todo_bindings.dart';
import '../../pages/edit_todo/views/edit_todo_page.dart';
import '../../pages/todo_details/commons/todo_detail_binding.dart';
import '../../pages/todo_details/views/todo_detail_page.dart';
import '../../pages/todo_list/commons/todo_list_bindings.dart';
import '../../pages/todo_list/views/todo_list_page.dart';
import 'route_paths.dart';

class RoutePages {
  static List<GetPage> pages = [
    GetPage(
        name: RoutePaths.todos,
        page: () => const TodoListPage(),
        binding: TodoListBinding(),
        children: [
          GetPage(
              name: RoutePaths.details,
              page: () => const TodoDetailPage(),
              binding: TodoDetailBinding()),
          GetPage(
              name: RoutePaths.addTodo,
              page: () => const AddTodoPage(),
              binding: AddTodoBindings()),
          GetPage(
              name: RoutePaths.editTodo,
              page: () => const EditTodoPage(),
              binding: EditTodoBindings()),
        ])
  ];
}
