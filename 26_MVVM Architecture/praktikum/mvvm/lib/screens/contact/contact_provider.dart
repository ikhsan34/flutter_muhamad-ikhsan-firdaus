import 'package:flutter/material.dart';
import 'package:mvvm/models/contact_model.dart';

class ContactProvider with ChangeNotifier {

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