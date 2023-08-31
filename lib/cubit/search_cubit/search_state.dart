part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoadingState extends SearchState {}

class SuccessFetchingDataState extends SearchState {
  final List<User> users;
  SuccessFetchingDataState({required this.users});
}
