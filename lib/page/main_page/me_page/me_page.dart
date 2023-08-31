import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_graph_ql/cubit/me_cubit/me_cubit.dart';

class MePage extends StatefulWidget {
  const MePage({super.key});

  @override
  State<MePage> createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Me Page"),
      ),
      body: BlocBuilder<MeCubit, MeState>(builder: (context, state) {
        return Stack(
          children: [
            if (state is MeSuccessState)
              Center(
                child: Column(
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
                      child: Text("${state.user.name?.substring(0,1)}", style: const TextStyle(fontSize: 30),),
                    ),
                    const SizedBox(height: 30),
                    Text("Name : ${state.user.name}", style: const TextStyle(fontSize: 22),),
                    const SizedBox(height: 30),
                    Text("Todos : ${state.user.todos?.length}", style: const TextStyle(fontSize: 22),),
                  ],
                ),
              ),
            if (state is MeLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),
          ],
        );
      }),
    );
  }
}
