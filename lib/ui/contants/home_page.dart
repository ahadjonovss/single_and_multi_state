import 'package:bloc_task/data/models/contact_model.dart';
import 'package:bloc_task/state_managers/cubit/contacts/contacts_cubit.dart';
import 'package:bloc_task/ui/widgets/contact_dialog.dart';
import 'package:bloc_task/ui/widgets/update_contact_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My contacts"),
        actions: [
          IconButton(
              onPressed: () {
               showDialog(
                 barrierDismissible: false,
                 context: context, builder: (context) => AddContactDialog(),);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: SizedBox(
        child: BlocBuilder<ContactsCubit, ContactsState>(
          builder: (context, state) {
            if (state is ContactsGotInSuccess) {
              List<ContactModel> contacts = state.contacts;
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: contacts.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    showDialog(context: context, builder: (context) => UpdateContactDialog(contactModel: contacts[index]),);
                  },

                  child: ListTile(
                    leading: Text((index+1).toString()),
                      title: Text(contacts[index].name),
                    trailing:  IconButton(
                      onPressed: () {
                        context.read<ContactsCubit>().deleteContact(contacts[index].id!);
                      },
                      icon: Icon(Icons.delete),
                    ),
                     ),
                ),
              );
            }
            if(state is ContactsInitial){
              context.read<ContactsCubit>().getContacts();
            }
            return TextButton(
                onPressed: () {
                  context.read<ContactsCubit>().getContacts();
                },
                child: Text("Qo'sh"));
          },
        ),
      ),
    );
  }
}
