import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app_graph_ql/models/todo.dart';

class OnceTodo extends StatefulWidget {
  final Todo todo;
  const OnceTodo({super.key, required this.todo});

  @override
  State<OnceTodo> createState() => _OnceTodoState();
}

class _OnceTodoState extends State<OnceTodo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Todo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          Container(
            width: 100,
            height: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.primaries[Random().nextInt(17)],
              shape: BoxShape.circle,
            ),
            child: Text(widget.todo.title!.isNotEmpty ? widget.todo.title!.substring(0,1).toString() : "", style: const TextStyle(fontSize: 30),),
          ),
          const SizedBox(height: 30),
          Text("TodoName : ${widget.todo.title}", style: const TextStyle(fontSize: 22),),
          const SizedBox(height: 30),
          Text("Id : ${widget.todo.id}", style: const TextStyle(fontSize: 22),),
          const SizedBox(height: 30),
          Text("IsCompleted : ${widget.todo.isCompleted}", style: const TextStyle(fontSize: 22),),
          const SizedBox(height: 30),
          Text("IsPublic : ${widget.todo.isPublic}", style: const TextStyle(fontSize: 22),),
          const SizedBox(height: 30),
          Text("CreatedAt : ${widget.todo.createdAt}", textAlign: TextAlign.center, style: const TextStyle(fontSize: 22),),
        ],
      ),
    );
  }
}
