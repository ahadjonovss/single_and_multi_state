import 'package:bloc_task/data/models/my_response.dart';
import 'package:bloc_task/rx/cards_bloc.dart';
import 'package:bloc_task/ui/widgets/banks_widget.dart';
import 'package:flutter/material.dart';

class RXDartTask extends StatelessWidget {
  const RXDartTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CardsBloc cardsBloc = CardsBloc();
    return Scaffold(
      appBar: AppBar(title: Text("RxDart")),
      body: StreamBuilder(
        stream: cardsBloc.responseStream,
        builder: (context, snapshot) {
         if(snapshot.hasData){
            if(snapshot.data!.error.isNotEmpty){
             return Text(cardsBloc.myResponse.value.error);
           }else{
             return BankWidget(cards: cardsBloc.myResponse.value.data);
           }
         }
         return Center(child: CircularProgressIndicator(),);
        },

      ),
    );
  }
}
