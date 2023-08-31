import 'package:bloc/bloc.dart';
import 'package:todo_app_graph_ql/models/user.dart';
import 'package:todo_app_graph_ql/service/graph_ql/gql_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meta/meta.dart';

part 'me_state.dart';

class MeCubit extends Cubit<MeState> {
  MeCubit() : super(const MeInitial());

  void getUserData() async {
    emit(const MeLoading());
    final QueryResult meTodoResult = await GQLService.gql.query(QueryOptions(
      document: gql(GQLRequest.getUser),
    ));

    if (meTodoResult.data == null) return;
    User user = User.fromJson(
        Map<String, Object?>.from(meTodoResult.data!["users_by_pk"] as Map));

    emit(MeSuccessState(user: user));
  }
}
