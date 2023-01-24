import 'package:bloc_task/state_managers/bloc/single_state_bloc/single_state_bloc.dart';
import 'package:bloc_task/state_managers/cubit/single_state_cubit/single_state_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleStateCubitPage extends StatelessWidget {
  const SingleStateCubitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Single State Cubit")),
      body: Center(
        child: BlocBuilder<SingleStateCubit, CubitSingleState>(
          builder: (context, state) {
            if(state.status==Status.ERROR){
              return Text(state.error.toString());
            }
            if(state.status==Status.SUCCESS){
              return Text("Data keldi");
            }
            if(state.status==Status.LOADING){
              return CircularProgressIndicator();
            }
            return Container();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<SingleStateCubit>().getData();
        },
      ),
    );
  }
}
