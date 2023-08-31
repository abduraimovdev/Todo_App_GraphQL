import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_graph_ql/cubit/home_cubit/home_cubit.dart';

import '../../../../models/todo.dart';

class TodosPage extends StatefulWidget {
  final bool isDelete;
  final List<Todo> allTodos;

  const TodosPage({Key? key, required this.allTodos, required this.isDelete})
      : super(key: key);

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: widget.allTodos.length,
        itemBuilder: (_, i) {
          final todo = widget.allTodos[i];
          return Card(
            child: ListTile(
              leading: Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.primaries[Random().nextInt(17)],
                  shape: BoxShape.circle,
                ),
                child: Text(
                  todo.title!.length > 1 ? todo.title!.substring(0, 1) : "",
                  style: const TextStyle(fontSize: 30),
                ),
              ),
              title: Text(todo.title.toString()),
              subtitle: Text(todo.userId.toString()),
              trailing: widget.isDelete
                  ? IconButton(
                      onPressed: () {
                        context.read<HomeCubit>().deleteTodo(todo.id!);
                      },
                      icon: const Icon(Icons.delete))
                  : const SizedBox(),
              onTap: () {
                context.push('/todo', extra: todo);
              },
            ),
          );
        },
      ),
    );
  }
}
