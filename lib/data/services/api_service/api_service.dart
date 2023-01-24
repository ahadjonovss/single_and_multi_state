import 'package:bloc_task/data/models/my_response.dart';
import 'package:bloc_task/data/services/api_service/api_client.dart';
import 'package:dio/dio.dart';

class ApiService extends ApiClient {
  Future<MyResponse> getTransfers() async {
    MyResponse myResponse=MyResponse(error: "");
    try {
      print("Keldi");
      Response response =
          await dio.get("${dio.options.baseUrl}/transactions-expenses");
      if (response.statusCode == 200) {
        // myResponse.data = response.data.map((e) => TransferModel.fromJson(e)).toList();
      }
    } catch (e) {
      myResponse.error = e.toString();
    }
    return myResponse;
  }

  Future<MyResponse> getCategories() async {
    MyResponse myResponse=MyResponse(error: "");
    try {
      print("Keldi");
      Response response =
      await dio.get("${dio.options.baseUrl}/income-types");
      if (response.statusCode == 200) {
        // myResponse.data = response.data.map((e) => CategoryModel.fromJson(e)).toList();
      }
    } catch (e) {
      myResponse.error = e.toString();
    }
    return myResponse;
  }
}
