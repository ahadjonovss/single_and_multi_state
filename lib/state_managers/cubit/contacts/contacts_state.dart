part of 'contacts_cubit.dart';

@immutable
abstract class ContactsState {}

class ContactsInitial extends ContactsState {}

class GetContactsState extends ContactsState {}


class ContactsGotInSuccess extends ContactsState {
  List<ContactModel> contacts;
  ContactsGotInSuccess({required this.contacts});
}

