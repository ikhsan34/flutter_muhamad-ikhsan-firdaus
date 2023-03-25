import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class Contact {

  String name;
  String phone;
  DateTime dob;
  Color color;
  PlatformFile path;


  Contact({
    required this.name, 
    required this.phone, 
    required this.dob,
    required this.color,
    required this.path
  });

}