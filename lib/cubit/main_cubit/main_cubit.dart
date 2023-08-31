import 'package:bloc/bloc.dart';
import 'package:todo_app_graph_ql/service/graph_ql/gql_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meta/meta.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainInitial(index: 0));

  void changePage(int index) {
    emit(MainInitial(index: index));
  }

  void createTodo(String title, bool isPublic) async {
    print("Created");
    final QueryResult allTodoResult = await GQLService.gql.mutate(
      MutationOptions(
          document: gql(GQLRequest.createTodoMutation(title, isPublic))),
    );
  }
}
