part of 'contacts_cubit.dart';

@immutable
abstract class ContactsState {}

class ContactsInitial extends ContactsState {}

class ContactsGotInSuccess extends ContactsState {
  List<ContactModel> contacts;
  ContactsGotInSuccess({required this.contacts});
}

class ContactsGotInProgress extends ContactsState {}

class ContactsGotInFailury extends ContactsState {
  String error;

  ContactsGotInFailury({required this.error});


}


