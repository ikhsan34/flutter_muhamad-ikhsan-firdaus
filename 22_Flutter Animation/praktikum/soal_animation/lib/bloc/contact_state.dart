part of 'contact_bloc.dart';

class ContactState extends Equatable {

  final List<Contact> contacts;

  const ContactState({required this.contacts});

  ContactState copyWith({List<Contact>? contacts}) {
    return ContactState(contacts: contacts ?? this.contacts);
  }

  ContactState createContact({required String name, required String phone}) {
    Contact newContact = Contact(name: name, phone: phone);
    return copyWith(contacts: List.of(contacts)..add(newContact));
  }

  ContactState deleteContact(int index) {
    return copyWith(contacts: List.of(contacts)..removeAt(index));
  }

  ContactState updateContact({required int index, required String name, required String phone}) {
    Contact newContact = Contact(name: name, phone: phone);
    return copyWith(contacts: List.of(contacts)..replaceRange(index, index + 1, [newContact]));
  }
  
  @override
  List<Object> get props => [contacts];
}

