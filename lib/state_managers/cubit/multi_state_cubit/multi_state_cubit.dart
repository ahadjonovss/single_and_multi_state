import 'package:bloc/bloc.dart';
import 'package:bloc_task/data/services/api_service/api_service.dart';
import 'package:bloc_task/utils/my_locale.dart';
import 'package:meta/meta.dart';

import '../../../data/models/my_response.dart';

part 'multi_state_state.dart';

class MultiStateCubit extends Cubit<MultiStateState> {
  MultiStateCubit() : super(MultiStateInitial());

  getData() async {
    emit(GettingDataInProgress());
    MyResponse myResponse = await myLocale<ApiService>().getAllCards();
    if(myResponse.error==""){
      emit(GettingDataInSuccess(cards: myResponse.data));
    }else{
      emit(GettingDataInFailury(error: myResponse.error));
    }
  }
}
