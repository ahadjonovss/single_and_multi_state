import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'single_state_event.dart';
part 'single_state_state.dart';

class SingleStateBloc extends Bloc<SingleStateEvent, SingleState> {
  SingleStateBloc() : super(SingleState(status: Status.PURE, error: "", cards: [])) {
    on<ChangeStatusEvent>(changeStatus);
    on<SetErrorEvent>(setError);
    on<SetCardsEvent>(setCards);
  }

  changeStatus(ChangeStatusEvent event, emit) =>state.copyWith(status: event.status);
  setError(SetErrorEvent event, emit) =>state.copyWith(error: event.error);
  setCards(SetCardsEvent event, emit) =>state.copyWith(cards: event.cards);
}
