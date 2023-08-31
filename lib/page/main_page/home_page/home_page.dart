import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_graph_ql/cubit/home_cubit/home_cubit.dart';
import 'package:todo_app_graph_ql/page/main_page/home_page/view_todo/todos_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Todos",
              ),
              Tab(
                text: "Me",
              ),
            ],
          ),
        ),
        body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
          return Stack(
            children: [
              if (state is HomeSuccessFetchDataState)
                TabBarView(
                  children: [
                    TodosPage(
                      allTodos: state.allTodos,
                      isDelete: false,
                    ),
                    TodosPage(
                      allTodos: state.meTodos,
                      isDelete: true,
                    ),
                  ],
                ),
              if (state is HomeLoading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          );
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.push('/create').whenComplete(() {
              context.read<HomeCubit>().fetchData();
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
