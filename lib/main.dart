import 'package:flutter/material.dart';
import 'package:todo_app_graph_ql/app.dart';
import 'package:todo_app_graph_ql/service/graph_ql/gql_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  runApp(
    GraphQLProvider(
      client: GQLService.client,
      child: const LearnGQL(),
    ),
  );
}
