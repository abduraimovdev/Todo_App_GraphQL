part of 'home_cubit.dart';

@immutable
abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeSuccessFetchDataState extends HomeState {
  final List<Todo> allTodos;
  final List<Todo> meTodos;
  const HomeSuccessFetchDataState({required this.allTodos, required this.meTodos});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeSuccessFetchDataState &&
          runtimeType == other.runtimeType &&
          allTodos == other.allTodos &&
          meTodos == other.meTodos;

  @override
  int get hashCode => allTodos.hashCode ^ meTodos.hashCode;
}