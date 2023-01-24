import 'package:bloc_task/state_managers/cubit/multi_state_cubit/multi_state_cubit.dart';
import 'package:bloc_task/ui/widgets/banks_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiStateCubitPage extends StatelessWidget {
  const MultiStateCubitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Multi State Cubit")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<MultiStateCubit>().getData();

        },
      ),
      body: Center(
        child: BlocBuilder<MultiStateCubit,MultiStateState>(
          builder: (context, state) {
            if(state is GettingDataInProgress){
              return CircularProgressIndicator();
            }
            if(state is GettingDataInSuccess){
              return BankWidget(cards: state.cards);
            }
            if(state is GettingDataInFailury){
              return Text("Error");
            }
            return Container();
          },
        ),
      ),

    );
  }
}
