import 'package:bloc_task/app/app.dart';
import 'package:bloc_task/state_managers/bloc/multi_state_bloc/multi_state_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiStateBlocPage extends StatelessWidget {
  const MultiStateBlocPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Multi State Bloc")),
      body: BlocConsumer<MultiStateBloc,MultiStateState>(
        builder: (context, state) {
          if(state is GettingDataInSuccess){
            return Center(
              child: Text("Data keldi"),
            );
          }
          if(state is GettingDataInFailury){
            return Center(
              child: Text(state.errorText),
            );
          }
          return Container();

        },
        listener: (context, state) {

        },

      ),
      floatingActionButton: FloatingActionButton(
          onPressed:() {
            context.read<MultiStateBloc>().add(GetDataFromApiEvent());
          }, ),
    );
  }
}
