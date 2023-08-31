import 'package:bloc/bloc.dart';
import 'package:todo_app_graph_ql/service/graph_ql/gql_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meta/meta.dart';

import '../../models/todo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitial());

  void fetchData() async{
    emit(const HomeLoading());
    List<Todo> allTodos = [];
    List<Todo> meTodos = [];
    final QueryResult allTodoResult = await GQLService.gql.query(QueryOptions(
      document: gql(GQLRequest.queryTodo),
    ));

    if(allTodoResult.data != null) {
      allTodos = (allTodoResult.data!["todos"] as List).map((json) => Todo.fromJson(Map<String, Object?>.from(json as Map))).toList();
    }

    final QueryResult meTodoResult = await GQLService.gql.query(QueryOptions(
      document: gql(GQLRequest.myTodos),
    ));

    if(meTodoResult.data != null) {
      meTodos = (meTodoResult.data!["todos"] as List).map((json) => Todo.fromJson(Map<String, Object?>.from(json as Map))).toList();
    }



    emit(HomeSuccessFetchDataState(allTodos: allTodos, meTodos: meTodos));
  }


  void deleteTodo(int id) async{
    final QueryResult allTodoResult = await GQLService.gql.mutate(MutationOptions(document: gql(GQLRequest.deleteTodoMutation(id))));
    fetchData();
  }

}
