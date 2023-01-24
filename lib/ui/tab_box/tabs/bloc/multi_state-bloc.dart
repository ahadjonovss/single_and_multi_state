import 'package:bloc_task/app/app.dart';
import 'package:bloc_task/state_managers/bloc/multi_state_bloc/multi_state_bloc.dart';
import 'package:bloc_task/ui/widgets/banks_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiStateBlocPage extends StatelessWidget {
  const MultiStateBlocPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Multi State Bloc")),
      body: Center(
        child: BlocConsumer<MultiStateBloc,MultiStateState>(
          builder: (context, state) {
            if(state is GettingDataInSuccess){
              return BankWidget(cards: state.cards);
            }
            if(state is GettingDataInFailury){
              return Text(state.errorText);
            }
            if(state is GettingDataInProgress){
              return CircularProgressIndicator();
            }
            return Container();

          },
          listener: (context, state) {

          },

        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed:() {
            context.read<MultiStateBloc>().add(GetDataFromApiEvent());
          }, ),
    );
  }
}
