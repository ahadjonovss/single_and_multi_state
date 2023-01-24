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
      body: Center(
        child: BlocBuilder<SingleStateBloc,SingleState>(
          builder: (context, state) {
            if(state.status==Status.SUCCESS){
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.cards!.length,
                itemBuilder: (context, index) =>ListTile(title: Text(state.cards![index].bankName)),);
            }
            if(state.status==Status.LOADING){
              return CircularProgressIndicator();
            }
            if(state.status==Status.ERROR){
              return Text(state.error.toString());
          }
            return Container();

          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         context.read<SingleStateBloc>().add(GetDataEvent());
        },
      ),

    );
  }
}
