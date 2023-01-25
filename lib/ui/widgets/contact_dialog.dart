import 'package:bloc_task/data/models/contact_model.dart';
import 'package:bloc_task/state_managers/cubit/contacts/contacts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddContactDialog extends StatelessWidget {
   AddContactDialog({Key? key}) : super(key: key);

  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        TextButton(onPressed: (){}, child: Text("Cancel")),
        TextButton(onPressed: (){
          context.read<ContactsCubit>().addContact(ContactModel(name: name.text, number: number.text, createdAt: DateTime.now().toString()));
          Navigator.pop(context);
        }, child: Text("Add")),
      ],
      content: SizedBox(
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:   [
            Text("Add Contact"),
            TextField(
              controller: name,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                hintText: "Name"
              ),
            ),
            TextField(
              controller: number,
              decoration: InputDecoration(
            hintText: "Number",

    border: OutlineInputBorder()),
            ),
          ],
        ),
      ),
    );
  }
}
