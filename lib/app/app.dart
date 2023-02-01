import 'package:bloc_task/getX/ui.dart';
import 'package:bloc_task/state_managers/bloc/multi_state_bloc/multi_state_bloc.dart';
import 'package:bloc_task/state_managers/bloc/single_state_bloc/single_state_bloc.dart';
import 'package:bloc_task/state_managers/cubit/connectivity/connectivity_cubit.dart';
import 'package:bloc_task/state_managers/cubit/multi_state_cubit/multi_state_cubit.dart';
import 'package:bloc_task/state_managers/cubit/single_state_cubit/single_state_cubit.dart';
import 'package:bloc_task/ui/tab_box/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SingleStateBloc(),),
        BlocProvider(create: (context) => MultiStateBloc(),),
        BlocProvider(create: (context) => SingleStateCubit(),),
        BlocProvider(create: (context) => MultiStateCubit(),),
        BlocProvider(create: (context) => ConnectivityCubit(),),
      ],
        child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GetXTask(),
    );
  }
}