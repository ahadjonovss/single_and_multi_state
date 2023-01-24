part of 'multi_state_cubit.dart';

@immutable
abstract class MultiStateState {}

class MultiStateInitial extends MultiStateState {}

class GettingDataInProgress extends MultiStateState{}
class GettingDataInFailury extends MultiStateState{
  String error;

  GettingDataInFailury({required this.error});

}
class GettingDataInSuccess extends MultiStateState{
  List cards;

  GettingDataInSuccess({required this.cards});

}

