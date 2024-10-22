import 'package:get/get.dart';

import '../../pages/todo_list/commons/todo_list_bindings.dart';
import '../../pages/todo_list/views/todo_list_page.dart';
import 'route_paths.dart';

class RoutePages {
  static List<GetPage> pages = [
    GetPage(
      name: RoutePaths.todos,
      page: () => const TodoListPage(),
      binding: TodoListBinding(),
    )
  ];
}
