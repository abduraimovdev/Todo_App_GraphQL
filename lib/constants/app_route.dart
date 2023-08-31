import 'package:go_router/go_router.dart';
import 'package:todo_app_graph_ql/models/todo.dart';
import 'package:todo_app_graph_ql/page/main_page/home_page/create_todo_page/create_todo_page.dart';
import 'package:todo_app_graph_ql/page/main_page/home_page/view_todo/once_todo.dart';
import 'package:todo_app_graph_ql/page/main_page/main_page.dart';

sealed class AppRoute {
  static GoRouter get route => GoRouter(
        routes: [
          GoRoute(
            path: '/',
            name: 'main',
            builder: (context, state) => const MainPage(),
            routes: [
              GoRoute(
                path: 'create',
                name: 'create',
                builder: (context, state) => const CreateTodoPage(),
              ),
              GoRoute(
                path: 'todo',
                name: 'todo',
                builder: (context, state) {
                  Todo todo = state.extra as Todo;
                  return OnceTodo(todo: todo);
                },
              ),
            ],
          ),
        ],
      );
}
