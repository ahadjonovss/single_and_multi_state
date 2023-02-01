import 'package:bloc_task/data/models/my_response.dart';
import 'package:bloc_task/data/services/api_service/api_service.dart';
import 'package:get/get.dart';


class MyGetXController extends GetxController{




  final RxBool isLoading = false.obs;

  final Rx<MyResponse> myResponse = MyResponse(error: '').obs;

  getData() async {
    isLoading.value=true;
    myResponse.value = await  ApiService().getAllCards();
    isLoading.value = false;
  }



}