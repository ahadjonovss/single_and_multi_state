import 'package:bloc_task/data/models/card_model.dart';
import 'package:bloc_task/data/models/my_response.dart';
import 'package:bloc_task/data/services/api_service/api_service.dart';
import 'package:rxdart/rxdart.dart';

class CardsBloc{

  CardsBloc(){
    getData();
  }
  final myResponse = BehaviorSubject<MyResponse>();
  final isLoading = BehaviorSubject<bool>();

  Stream<bool> get getLoaderStatus => isLoading.stream;

  ValueStream<MyResponse> get responseStream => myResponse.stream;

  getData() async {
    isLoading.sink.add(true);
    myResponse.sink.add(await  ApiService().getAllCards());
    isLoading.sink.add(false);

  }

}