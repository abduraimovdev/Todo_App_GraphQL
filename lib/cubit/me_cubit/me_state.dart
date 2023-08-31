part of 'me_cubit.dart';

@immutable
abstract class MeState {
  const MeState();
}

class MeInitial extends MeState {
  const MeInitial();
}

class MeLoading extends MeState {
  const MeLoading();
}

class MeSuccessState extends MeState {
  final User user;
  const MeSuccessState({required this.user});
}