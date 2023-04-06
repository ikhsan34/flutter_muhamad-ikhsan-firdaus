part of 'contact_bloc.dart';

abstract class ContactEvent {
  const ContactEvent();

}

class CreateContactSubmitted extends ContactEvent {

  final String name;
  final String phone;

  const CreateContactSubmitted(this.name, this.phone);
}

class DeleteContactByIndex extends ContactEvent {
  final int index;

  const DeleteContactByIndex(this.index);
}