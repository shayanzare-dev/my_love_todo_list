import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'infrastructure/route/route_names.dart';
import 'infrastructure/route/route_pages.dart';

class MyLoveTodoList extends StatelessWidget {
  const MyLoveTodoList({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        title: 'my-love-todo-list',
        initialRoute: RouteNames.todos,
        getPages: RoutePages.pages,
      );
}
