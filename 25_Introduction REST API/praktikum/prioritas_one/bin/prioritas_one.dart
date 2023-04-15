import 'package:prioritas_one/prioritas_one.dart' as prioritas_one;
import 'package:prioritas_one/prioritas_one.dart';

void main(List<String> arguments) async {
  // Nomor 1 - Post
  print(await prioritas_one.postContact());

  // Nomor 2 - Get - Json Decode
  Contact contact = await prioritas_one.getContact();
  print('id: ${contact.id} \nname: ${contact.name} \nphone: ${contact.phone}');

  // Nomor 3 - PUT
  print(await prioritas_one.putContact());
}
