import 'package:bloc_task/data/services/api_service/api_service.dart';
import 'package:bloc_task/state_managers/bloc/single_state_bloc/single_state_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleStateBlocPage extends StatelessWidget {
  const SingleStateBlocPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Single State Bloc")),
      body: BlocConsumer<SingleStateBloc,SingleState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          if(state.error!=null){
            return Center(
              child: Text("Data keldi"),
            );
          }
          if(state.status==Status.LOADING){
            return Center(
              child: Text("Loading"),
            );
          }
          if(state.cards!=null){
            return Center(
            child: Text("Data Keldi"),
            );
        }
          return Container();

        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         context.read<SingleStateBloc>().add(GetDataEvent());
        },
      ),

    );
  }
}
