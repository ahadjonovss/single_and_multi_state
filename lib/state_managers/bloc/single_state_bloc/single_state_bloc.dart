import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_task/data/models/my_response.dart';
import 'package:bloc_task/data/services/api_service/api_service.dart';
import 'package:bloc_task/utils/my_locale.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'single_state_event.dart';
part 'single_state_state.dart';

class SingleStateBloc extends Bloc<GetDataEvent, SingleState> {
  SingleStateBloc() : super(SingleState()) {
    on<GetDataEvent>(getData);
  }

  getData(GetDataEvent event, emit) async {
    emit(state.copyWith(status: Status.LOADING));
    MyResponse myResponse = await myLocale<ApiService>().getAllCards();
    if(myResponse.error==""){
      emit(state.copyWith(cards: myResponse.data,status: Status.SUCCESS));

    }else{
      emit(state.copyWith(error: myResponse.error,status: Status.ERROR));

    }

  }
}
