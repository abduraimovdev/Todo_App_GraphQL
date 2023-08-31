import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

sealed class GQLService {
  /// setting and connecting url
  static final HttpLink _httpLink = HttpLink('https://hasura.io/learn/graphql');

  static final AuthLink _authLink = AuthLink(
    // Agar ishlamasa Shu Saytdan Bearar key Olib qo'ying
    // Bearer Key => https://hasura.io/learn/graphql/graphiql;
    getToken: () async =>
        'Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik9FWTJSVGM1UlVOR05qSXhSRUV5TURJNFFUWXdNekZETWtReU1EQXdSVUV4UVVRM05EazFNQSJ9.eyJodHRwczovL2hhc3VyYS5pby9qd3QvY2xhaW1zIjp7IngtaGFzdXJhLWRlZmF1bHQtcm9sZSI6InVzZXIiLCJ4LWhhc3VyYS1hbGxvd2VkLXJvbGVzIjpbInVzZXIiXSwieC1oYXN1cmEtdXNlci1pZCI6ImF1dGgwfDY0ZWViZWViZjM3MmNlZmMwOWYzMWYzZiJ9LCJuaWNrbmFtZSI6ImNvZGVyODExOCIsIm5hbWUiOiJjb2RlcjgxMThAZ21haWwuY29tIiwicGljdHVyZSI6Imh0dHBzOi8vcy5ncmF2YXRhci5jb20vYXZhdGFyL2ExYjBlMGI1Nzk3Mzk1ZWM3Y2QxNDlmYzAyYjQyZDU1P3M9NDgwJnI9cGcmZD1odHRwcyUzQSUyRiUyRmNkbi5hdXRoMC5jb20lMkZhdmF0YXJzJTJGY28ucG5nIiwidXBkYXRlZF9hdCI6IjIwMjMtMDgtMzBUMDY6MjE6MTUuMzk0WiIsImlzcyI6Imh0dHBzOi8vZ3JhcGhxbC10dXRvcmlhbHMuYXV0aDAuY29tLyIsImF1ZCI6IlAzOHFuRm8xbEZBUUpyemt1bi0td0V6cWxqVk5HY1dXIiwiaWF0IjoxNjkzNDk4NTg0LCJleHAiOjE2OTM1MzQ1ODQsInN1YiI6ImF1dGgwfDY0ZWViZWViZjM3MmNlZmMwOWYzMWYzZiIsImF0X2hhc2giOiI4ZHlWcG5ZSzkxY2JsNVpBTHZzNHpnIiwic2lkIjoiczlERmNNemVqSmRQMnR5YWdlX1dGM1RMVzFfS1p4UTgiLCJub25jZSI6Ik9CT1pqTmRwcWxDQ3EwUzVWRU5QdzF3dDl0TFNxRnFPIn0.DbC5wJKs8NFkoIkcpQZ7Dah_Q6I3NvwpJS2H1kVtJOeU1ZM1C9QZvSFrXkUR7qyVzoVFa2OFQPbWYwWRu8mGEkxBy6zMRx0gmkDf6W9nmYUjcuUJgR27ffQ2ya9WI17qneaEzITl1Lam5rabmgdYZoFKTaJ06G0J6sxHTSllwP9ph2VPN6-MSbWG08CdOocF7OHM_s7KmzIn0K-dkLjuH3V-fM65bJ5T-eTl0JcC9ERlJdUWI5Dy8coC2PAGeHhjrT7mMAv-o4gqVW58rpa33k7UtiP4KFJAzUAxtgu3EqCbBbQBYXiO_3ly1PIWkOtVLecgr6PYRg0Z-vH4l5I1pw',
  );

  static final Link link = _authLink.concat(_httpLink);

  /// controller
  static GraphQLClient get gql =>
      GraphQLClient(cache: GraphQLCache(), link: link);
  static ValueNotifier<GraphQLClient> client = ValueNotifier(gql);
}

sealed class GQLRequest {
  static const queryTodo = """
query{
  todos {
    id
    is_completed
    created_at
    is_public
    title
    user_id
  }
}  
  """;

  static const queryUser = """
query{
  users {
    id
    name
  }
}
  """;


  static const myTodos ="""
query{
  todos(where: {user_id: {_like: "%64eebeebf372cefc09f31f3f%"}}) {
    created_at
    id
    is_completed
    is_public
    title
    user_id
  }
}
""";

  static const getUser = """
query{
  users_by_pk(id: "auth0|64eebeebf372cefc09f31f3f") {
    id
    name
    todos {
      id
    }
  }
}
  """;


  static String searchUserQuery(String text) => """
query{
  users(where: {name: {_like: "%$text%"}}) {
    name
    id
  }
}

  """;

  static String createTodoMutation(String title, bool isPublic) => """
mutation {
  insert_todos(objects: {is_public: $isPublic, title: "$title"}) {
    returning {
      id
    }
  }
}
  """;

  static String deleteTodoMutation(int id) => """
mutation {
  delete_todos(where: {id: {_eq: $id}}) {
    returning {
      id
    }
  }
}
  """;
}
