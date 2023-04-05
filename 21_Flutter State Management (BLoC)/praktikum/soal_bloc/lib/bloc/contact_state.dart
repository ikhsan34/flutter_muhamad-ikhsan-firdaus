part of 'contact_bloc.dart';

class Contact extends Equatable {

  final String? name;
  final String? phone;

  const Contact({required this.name, required this.phone});

  Contact copyWith({String? name, String? phone}) {
    return Contact(name: name ?? this.name, phone: phone ?? this.phone);
  }

  @override
  List<Object?> get props => [];
}

class ContactState extends Equatable {

  final List<Contact> contacts;

  const ContactState({required this.contacts});

  ContactState copyWith({List<Contact>? contacts}) {
    return ContactState(contacts: contacts ?? this.contacts);
  }
  
  @override
  List<Object> get props => [contacts];
}

