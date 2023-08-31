import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_graph_ql/cubit/home_cubit/home_cubit.dart';
import 'package:todo_app_graph_ql/cubit/main_cubit/main_cubit.dart';

class CreateTodoPage extends StatefulWidget {
  const CreateTodoPage({super.key});

  @override
  State<CreateTodoPage> createState() => _CreateTodoPageState();
}

class _CreateTodoPageState extends State<CreateTodoPage> {
  TextEditingController nameController = TextEditingController();
  bool isPublic = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Create Todo"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const Text("Name"),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(filled: true),
            ),
            const SizedBox(height: 30),
            const Text("IsPublics"),
            Switch.adaptive(
              value: isPublic,
              onChanged: (value) => setState(() {
                isPublic = value;
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<MainCubit>().createTodo(nameController.text.trim(), isPublic);
          context.pop();
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
