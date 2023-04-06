part of 'contact_bloc.dart';

class ContactState extends Equatable {

  final List<Contact> contacts;

  const ContactState({required this.contacts});

  ContactState copyWith({List<Contact>? contacts}) {
    return ContactState(contacts: contacts ?? this.contacts);
  }

  ContactState createContact(Contact contact) {
    return copyWith(contacts: List.of(contacts)..add(contact));
  }

  ContactState deleteContact(int index) {
    return copyWith(contacts: List.of(contacts)..removeAt(index));
  }
  
  @override
  List<Object> get props => [contacts];
}

