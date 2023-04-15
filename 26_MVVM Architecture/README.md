# (26) MVVM Architecture

## Apa itu MVVM Architecture?
Model-View-ViewModel bertujuan untuk memisahkan logic dengan tampilan (view) ke dalam ViewModel.

## Keuntungan dari MVVM
+ Reusability
+ Maintainability
+ Testability

## Aturan pada MVVM
### Struktur Direktori
+ Model memiliki 2 bagian, yaitu bentuk data yang akan digunakan dan sumber dari data tersebut
+ Tiap screen diletakkan dalam sebuah direktori yang di dalamnya terdapat View dan ViewModel.

![image](https://user-images.githubusercontent.com/10411833/232256755-fb44d7d1-0ce4-4319-88e0-489edd4a0990.png)

## Melakukan MVVM
### Model
+ Bentuk data yang akan digunakan, dibuat dalam bentuk class
+ Data-data yang dimuat, diletakkan pada property

```dart
class Contact {
  final int id;
  final String name;
  final String phone;
  
  Contact({required this.id, required this.name, required this.phone});
}
```

### Model-API
```dart
class ContactAPI {
  static Future<List<Contact>> getContacts() async {
    final response = await Dio().get('https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts');
    List<Contact> contacts = (response.data as List)
      .map((e) => Contact(id:e['id'], name: e['name'], phone: e['phone']))
      .toList();
    
    return contacts;
  }
}
```

### ViewModel
+ Menyimpan data-data dan logic yang diperlukan halaman ContactScreen
+ Jika widget lain memerlukan logic yang sama, dapat menggunakan ViewModel ini juga

```dart
class ContactViewModel with ChangeNotifier {
  List<Contact> _contacts = [];
  
  List<Contact> get contacts => _contacts;
  
  getAllContacts() async {
    final c = await ContactAPI.getContacts();
    _contacts = c;
    notifyListeners();
  }
}
```

### Mendaftarkan ViewModel
+ Menggunakan MultiProvider agar dapat menggunakan banyak ViewModel
+ MaterialApp sebagai child

```dart
runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ContactViewModel(),
      )
    ],
    child: const MaterialApp(
      home: ContactScreen()
    )
  )
);
```

### View
+ Meggunakan StatefulWidget

```dart
@override
void initState() {
  super.initState();
  Provider.of<ContactViewModel>(context, listen: false).getAllContacts();
}
```

### Menampilkan data di View
+ Letakkan pada bagian build
+ Menggunakan getters yang ada pada ViewModel
+ Data dapat langsung ditampilkan pada widgets

```dart
final modelView = Provider.of<ContactViewModel>(context);

return Scaffold(
  appBar: AppBar(
    title: const Text('Contacts')
  ),
  body: ListView.builder(
    itemCount: modelView.contacts.length,
    itemBuilder: (context, index) {
      final contact = modelView.contacts[index];
      return ListTile(
        title: Text(contact.name),
        subtitle: Text(contact.phone)
      );
    }
  )
);
```


















