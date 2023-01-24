import 'package:bloc_task/ui/tab_box/tabs/bloc/multi_state-bloc.dart';
import 'package:bloc_task/ui/tab_box/tabs/bloc/single_state_bloc.dart';
import 'package:bloc_task/ui/tab_box/tabs/cubit/multi_state_cubit.dart';
import 'package:bloc_task/ui/tab_box/tabs/cubit/single_state_cubit.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage=0;
  @override
  Widget build(BuildContext context) {
    List pages = [
      SingleStateBlocPage(),
      MultiStateBlocPage(),
      SingleStateCubitPage(),
      MultiStateCubitPage()
    ];
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.block),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.block),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.currency_bitcoin),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.currency_bitcoin),label: ""),
        ],
      ),


    );
  }
}
