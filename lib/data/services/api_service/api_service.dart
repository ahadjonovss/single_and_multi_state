import 'package:bloc_task/data/models/card_model.dart';
import 'package:bloc_task/data/models/my_response.dart';
import 'package:bloc_task/data/services/api_service/api_client.dart';
import 'package:dio/dio.dart';

class ApiService extends ApiClient {
  Future<MyResponse> getAllCards() async {
    MyResponse myResponse=MyResponse(error: "");
    try {
      print("Keldi");
      Response response =
      await dio.get("${dio.options.baseUrl}/user_cards");
      if (response.statusCode == 200) {
        myResponse.data = response.data.map((e) => CardModel.fromJson(e)).toList();
        print("hammasi udar");
      }
    } catch (e) {
      myResponse.error = e.toString();
      print(e.toString());
    }
    return myResponse;
  }
}
