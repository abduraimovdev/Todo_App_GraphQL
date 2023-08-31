import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_graph_ql/cubit/search_cubit/search_cubit.dart';
import 'package:todo_app_graph_ql/page/main_page/search_page/view/custom_search_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Page"),
        bottom: const PreferredSize(
          preferredSize: Size(double.infinity, 70),
          child: CustomSearchBar(),
        ),
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return Stack(
            children: [
              if (state is SuccessFetchingDataState)
                ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: state.users.length,
                  itemBuilder: (_, i) {
                    final todo = state.users[i];
                    return Card(
                      child: ListTile(
                        title: Text(todo.name.toString()),
                        subtitle: Text(todo.id.toString()),
                      ),
                    );
                  },
                ),
              if (state is SearchLoadingState)
                const Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          );
        },
      ),
    );
  }
}

