# (20) Flutter State Management (Provider)

## Pengertian State
State merupakan data yang dapat dibaca saat pembuatan widget. State dapat berubah saat widget sedang aktif. State yang berubah hanya dimiliki oleh StatefulWidget

### Mengapa Perlu Global State?
Global state dibutuhkan agar antara widget dapat memanfaatkan state yang sama dengan mudah.

![image](https://user-images.githubusercontent.com/10411833/229383269-25138cf4-9d37-4486-922d-ae6bd0b7dcf7.png)

### Memanfaatkan State
+ State dapat dibuat sebagai property dari class
+ State digunakan pada widget saat build

```dart
var number = 0;

Text('$number')
```

### Mengubah State
Untuk mengubah state dapat dilakukan dengan menggunakan setState();

```dart
ElevatedButton(
  child: const Text('Tambah'),
  onPressed: () {
    setState(() {
      number = number + 1;
    });
  }
)
```

## Global State
Global State merupakan state yang dapat digunakan pada seluruh widget.

### Provider
Provider merupakan salah satu State Management pada flutter. Provider perlu di-install agar dapat digunakan.

#### Installasi Provider
+ Untuk menginstall provider dapat dilakukan dengan menambahkan package Provider pada pubspec.yaml

```yaml
dependencies:
  provider:
```

#### Membuat State Provider
+ Buatlah file bernama contact.dart
+ Definisikan state dalam bentuk class

```dart
import 'package:flutter/material.dart';

class Contact with ChangeNotifier {
  List<Map<String, String>> _contacts = [];
  List<Map<String, String>> get contacts => _contacts;
  
  void add(Map<String, String> contact) {
    _contacts.add(contact);
    notifyListeners();
  }
}
```

#### Mendaftarkan State Provider
+ Import di dalam file main.dart
+ Daftarkan pada runApp dengan MultiProvider

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:phonebookapp/stores/contact.dart' as contact_store;

void main() {
  runApp(
    MultiProvider(
      providers: [
        changeNotifierProvider(
          create: (_) => contact_store.Contact()
        )
      ],
      child: MyWidget(),
    )
  );
}
```

#### Menggunakan State dari Provider
+ Simpan provider dalam variable
+ Ambil data dari provider melalui getter

```dart
final contactProvider = Provider.of<contact_store.Contact>(context);

ListView.builder(
  itemCount: contactProvider.contacts.length,
  itemBuilder: (context, index) {
    return listTile(
      title: Text(contactProvider.contacts[index]['name'] ?? ''),
      subtitle: Text(contactProvider.contacts[index]['phone'] ?? ''),
    );
  }
);
```


