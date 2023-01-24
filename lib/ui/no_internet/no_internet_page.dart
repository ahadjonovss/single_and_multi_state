import 'package:bloc_task/state_managers/cubit/connectivity/connectivity_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoInternetPage extends StatelessWidget {
  VoidCallback voidCallback;

  NoInternetPage({required this.voidCallback, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: BlocListener<ConnectivityCubit,ConnectivityState>(
          listener: (context, state) {
            if (state.connectivityResult != ConnectivityResult.none) {
              voidCallback.call();
              Navigator.pop(context);
            }
          },
            child: Scaffold(
              body: Center(
                child: Text("No internet connection"),
              ),

            )));
  }
}
