part of 'main_cubit.dart';

@immutable
abstract class MainState {
  final int index;
  const MainState({required this.index});
}

class MainInitial extends MainState {
  const MainInitial({required super.index});
}

