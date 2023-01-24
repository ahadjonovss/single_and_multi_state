import 'package:bloc_task/data/services/api_service/api_service.dart';
import 'package:flutter/material.dart';

class SingleStateBlocPage extends StatelessWidget {
  const SingleStateBlocPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Single State Bloc")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ApiService().getAllCards();
        },
      ),

    );
  }
}
