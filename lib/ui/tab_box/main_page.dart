import 'package:bloc_task/getX/ui.dart';
import 'package:bloc_task/rx/ui.dart';
import 'package:bloc_task/state_managers/cubit/connectivity/connectivity_cubit.dart';
import 'package:bloc_task/ui/no_internet/no_internet_page.dart';
import 'package:bloc_task/ui/tab_box/tabs/bloc/multi_state-bloc.dart';
import 'package:bloc_task/ui/tab_box/tabs/bloc/single_state_bloc.dart';
import 'package:bloc_task/ui/tab_box/tabs/cubit/multi_state_cubit.dart';
import 'package:bloc_task/ui/tab_box/tabs/cubit/single_state_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  _init() async {
    print("INTERNET TURNED ON CALL ANY API");
  }
  int currentPage=0;
  @override
  Widget build(BuildContext context) {
    List pages = [
      RXDartTask(),
      GetXTask()
    ];
    return BlocListener<ConnectivityCubit,ConnectivityState>(
      listener: (context, state) {
        if (state.connectivityResult == ConnectivityResult.none) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => NoInternetPage(voidCallback: _init),));
        }
      },
      child: Scaffold(
        body: pages[currentPage],

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (value) {
            currentPage=value;
            setState(() {});
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.block),label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.block),label: ""),
          ],
        ),


      ),
    );
  }
}
