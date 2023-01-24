import 'package:flutter/material.dart';

class BankWidget extends StatelessWidget {
  List cards;
   BankWidget({required this.cards,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: cards.length,
      itemBuilder: (context, index) =>ListTile(title: Text(cards[index].bankName)),);
  }
}
