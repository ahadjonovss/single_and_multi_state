import 'package:bloc_task/getX/view_model.dart';
import 'package:bloc_task/ui/widgets/banks_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class GetXTask extends StatelessWidget {
  const GetXTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyGetXController myGetXController = Get.put(MyGetXController());
    return Scaffold(
      appBar: AppBar(title: Text("GetX"),),
      body: Obx(
        () {
          return Center(
            child: myGetXController.isLoading.value == true
                ? CircularProgressIndicator()
                : myGetXController.myResponse.value.error.isNotEmpty
                ? Text(myGetXController.myResponse.value.error)
                : BankWidget(cards: myGetXController.myResponse.value.data),
          );
        },

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myGetXController.getData();
        },
      ),
    );
  }
}
