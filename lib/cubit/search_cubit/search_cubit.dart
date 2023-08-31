import 'package:bloc/bloc.dart';
import 'package:todo_app_graph_ql/models/user.dart';
import 'package:todo_app_graph_ql/service/graph_ql/gql_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  void fetchTodo() async {
    print("Fetching Users...");
    emit(SearchLoadingState());
    final QueryResult result = await GQLService.gql.query(QueryOptions(
      document: gql(GQLRequest.queryUser),
    ));

    if (result.data != null) {
      List<User> list = (result.data!["users"] as List)
          .map((json) => User.fromJson(Map<String, Object?>.from(json as Map)))
          .toList();
      emit(SuccessFetchingDataState(users: list));
    }
  }

  void searchUser(String name) async {
    print("Searching Users...");
    emit(SearchLoadingState());
    final QueryResult result = await GQLService.gql.query(QueryOptions(
      document: gql(GQLRequest.searchUserQuery(name)),
    ));

    if (result.data != null) {
      List<User> list = (result.data!["users"] as List)
          .map((json) => User.fromJson(Map<String, Object?>.from(json as Map)))
          .toList();
      emit(SuccessFetchingDataState(users: list));
    }
  }
}
