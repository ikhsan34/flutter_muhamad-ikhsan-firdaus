// Soal Prioritas 1
import 'package:dio/dio.dart';
import 'dart:convert';

// Nomor 1 - POST
Future<Map> postContact() async {
  final dio = Dio();

  final response = await dio.post(
    'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts',
    data: {
      'name': 'Ikhsan Fi', 
      'phone': '089513824969'
    }
  );

  return jsonDecode(response.toString());
}



// Nomor 2 - Decode to Object
class Contact {
  final int id;
  final String name;
  final String phone;

  Contact({required this.id, required this.name, required this.phone});

  static Contact fromJson({required dynamic json}) {
    final contact = jsonDecode(json.toString());
    return Contact(id: contact['id'], name: contact['name'], phone: contact['phone']);
  }

}

Future<Contact> getContact() async {
  final dio = Dio();

  final response = await dio.get('https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2');

  return Contact.fromJson(json: response);
}

// Nomor 3 - PUT
Future<Map> putContact() async {
  final dio = Dio();

  final response = await dio.put(
    'https://jsonplaceholder.typicode.com/posts/1',
    data: {
      'userId': 2,
      'title': 'Ini Judul',
      'body': 'Ini Body'
    }
  );

  return jsonDecode(response.toString());
}

