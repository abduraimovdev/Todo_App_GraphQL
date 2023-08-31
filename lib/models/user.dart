import 'package:todo_app_graph_ql/models/todo.dart';

final json = {
  "id": "auth0|5cc0ea100e618b11b031bb99",
  "name": "tui.glen",
  "todos": []
};

class User {
  String? id;
  String? name;
  List<Todo>? todos;

  User({required this.id, required this.name, required this.todos});

  factory User.fromJson(Map<String, Object?> json) => User(
        id: json["id"] as String,
        name: json["name"] as String,
        todos: json["todos"] is List
            ? (json["todos"] as List).map((e) => Todo.fromJson(e)).toList()
            : null,
      );

  Map<String, Object?> toJson() => {
        "id": id ?? "",
        "name": name ?? "",
        "todos": todos ?? [],
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          todos == other.todos;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ todos.hashCode;

  @override
  String toString() {
    return 'User{id: $id, name: $name, todos: $todos}';
  }
}
