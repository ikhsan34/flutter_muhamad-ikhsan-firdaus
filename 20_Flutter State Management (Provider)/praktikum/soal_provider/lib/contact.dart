import 'package:flutter/material.dart';

class Contact {

  String name;
  String phone;

  Contact({required this.name, required this.phone});

}

class Contacts with ChangeNotifier {

  List<Contact> _contacts = [];

  List<Contact> get contacts => _contacts;

  void add(Contact contact) {
    _contacts.add(contact);
    notifyListeners();
  }

  void remove(Contact contact) {
    _contacts.removeWhere((element) => element == contact); // element.name == contact.name && element.phone == contact.phone
    notifyListeners();
  }

}