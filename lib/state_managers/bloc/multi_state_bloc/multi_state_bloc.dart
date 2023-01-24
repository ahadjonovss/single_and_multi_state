import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'multi_state_event.dart';
part 'multi_state_state.dart';

class MultiStateBloc extends Bloc<MultiStateEvent, MultiStateState> {
  MultiStateBloc() : super(MultiStateInitial()) {
    on<MultiStateEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
