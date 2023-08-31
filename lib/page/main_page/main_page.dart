import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_graph_ql/cubit/home_cubit/home_cubit.dart';
import 'package:todo_app_graph_ql/cubit/main_cubit/main_cubit.dart';
import 'package:todo_app_graph_ql/cubit/me_cubit/me_cubit.dart';
import 'package:todo_app_graph_ql/cubit/search_cubit/search_cubit.dart';
import 'package:todo_app_graph_ql/page/main_page/home_page/home_page.dart';
import 'package:todo_app_graph_ql/page/main_page/me_page/me_page.dart';
import 'package:todo_app_graph_ql/page/main_page/search_page/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController pageController = PageController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<MainCubit, MainState>(
        bloc: context.read<MainCubit>(),
        listener: (context, state) {
          pageController.jumpToPage(state.index);
        },
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            BlocProvider(
              create: (context) =>
              HomeCubit()
                ..fetchData(),
              child: const HomePage(),
            ),
            BlocProvider(
              create: (context) =>
              SearchCubit()
                ..fetchTodo(),
              child: const SearchPage(),
            ),
            BlocProvider(
              create: (context) => MeCubit()..getUserData(),
              child: const MePage(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.index,
            onTap: (index) => context.read<MainCubit>().changePage(index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.menu, size: 30),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search, size: 30),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.circle, size: 30),
                label: "",
              ),
            ],
          );
        },
      ),
    );
  }
}
