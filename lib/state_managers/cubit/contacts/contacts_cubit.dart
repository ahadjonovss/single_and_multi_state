import 'package:bloc/bloc.dart';
import 'package:bloc_task/data/models/contact_model.dart';
import 'package:bloc_task/data/repositories/contacts_repository.dart';
import 'package:bloc_task/utils/my_locale.dart';
import 'package:meta/meta.dart';

part 'contacts_state.dart';

class ContactsCubit extends Cubit<ContactsState> {
  ContactsCubit() : super(ContactsInitial());

  addContact(ContactModel newContact) async {
    await myLocale<ContactsRepository>().addContact(newContact);
    emit(GetContactsState());
  }

  updateContact(ContactModel newContact) async {
    await myLocale<ContactsRepository>().updateContact(newContact);
    emit(GetContactsState());
  }

  deleteContact(int id) async {
    await myLocale<ContactsRepository>().deleteCustomer(id);
    emit(GetContactsState());
  }

  getContacts() async {
    var result = await myLocale<ContactsRepository>().getContact();
    emit(ContactsGotInSuccess(contacts: result.map((e) => ContactModel.fromJson(e)).toList()));
  }
}
