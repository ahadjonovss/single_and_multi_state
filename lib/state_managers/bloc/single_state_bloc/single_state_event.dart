part of 'single_state_bloc.dart';

@immutable
abstract class SingleStateEvent {}

class ChangeStatusEvent extends SingleStateEvent{
  final Status status;
  ChangeStatusEvent({required this.status});
}

class SetCardsEvent extends SingleStateEvent{
  final List cards;
  SetCardsEvent({required this.cards});
}

class SetErrorEvent extends SingleStateEvent{
  final String error;
  SetErrorEvent({required this.error});
}

class GetDataEvent extends SingleStateEvent{}

