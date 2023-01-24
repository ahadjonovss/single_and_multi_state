import 'package:bloc/bloc.dart';
import 'package:bloc_task/data/models/card_model.dart';
import 'package:bloc_task/data/models/my_response.dart';
import 'package:bloc_task/data/services/api_service/api_service.dart';
import 'package:bloc_task/utils/my_locale.dart';
import 'package:meta/meta.dart';

part 'multi_state_event.dart';
part 'multi_state_state.dart';

class MultiStateBloc extends Bloc<MultiStateEvent, MultiStateState> {
  MultiStateBloc() : super(MultiStateInitial()) {
    on<GetDataFromApiEvent>(getData);
  }

  getData(event, emit) async {
    emit(GettingDataInProgress());
    MyResponse myResponse = await myLocale<ApiService>().getAllCards();
    if(myResponse.error==""){
      emit(GettingDataInSuccess(cards: myResponse.data));
    }else{
      emit(GettingDataInFailury(errorText: myResponse.error));
    }

  }
}
