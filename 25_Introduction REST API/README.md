# (25) Introduction REST API - JSON serialization/deserialization

#### **Table of content** 
[Introduction](#introduction) \
[REST API Continue](#rest-api-continue)

# Introduction
## REST API
**Representational State Transfer Application Programming Interface** merupakan arsitektural yang memisahkan tampilan dengan proses bisnis. REST API juga merupakan bagian tampilan dengan proses bisnis berkirim data melalui HTTP Request.

![image](https://user-images.githubusercontent.com/10411833/230741800-f88ea224-c373-4cb2-9266-16410db454f4.png)

## HTTP
HTTP merupakan protokol yang digunakan untuk berkirim data pada internet, biasanya data tersebut berbentuk media web.

### Pola Komunikasi
+ Client mengirim request
+ Server mengolah dan membalas dengan memberi response

![image](https://user-images.githubusercontent.com/10411833/230741836-41c3c9ab-54db-4bc7-8240-a5f272c584bb.png)

### Struktur Request & Response

#### Request
+ **URL**, alamat halaman yang akan diakses
+ **Method** (GET, POST, PUT, DELETE), menunjukan aksi yang diinginkan
+ **Header**, Informasi tambahan terkait request yang akan dikirimkan
+ **Body**, Data yang disertakan bersama request

#### Response
+ **Status Code**, kode yang mewakili keseluruhan response, baik sukses maupun gagal
+ **Header**, informasi tambahan terkait response yang diberikan
+ **Body**, data yang disertakan bersama response

## DIO
DIO berfungsi sebagai HTTP Client dan dimanfaatkan untuk melakukan consume REST API.

### Instalasi
+ Tambahkan dependency pada pubspec.yaml

```dart
dependencies:
  dio:
```

### Penggunaan
Penggunaan DIO dalam pengambilan data dan menampilkan hasilnya pada console.

```dart
import 'package:dio/dio.dart';

Dio()
  .get('https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts')
  .then((response) {
    print(response);
  });
```

## Serialisasi JSON
Serialisasi merupakan cara penulisan data dengan Javascript Object Notation dan umum digunakan pada REST API.\
1. Mengubah struktur data ke bentuk JSON

![image](https://user-images.githubusercontent.com/10411833/230742154-b369364f-377b-40da-99bd-cdb55879ed6e.png)

Menggunakan fungsi jsonEncode dari package dart:convert \
```dart
import 'dart:convert';

void main() {
  var dataMap = { ... };
  var dataJson = jsonEncode(dataMap);
  print(dataJSON);
}
```

2. Mengubah bentuk JSON ke struktur data

![image](https://user-images.githubusercontent.com/10411833/230742220-cfe93db5-5798-402e-a88b-dbd6fab8709a.png)

Menggunakan fungsi jsonDecode
```dart
import 'dart:convert';

void main() {
  var dataJSON = '...';
  var dataMap = jsonDecode(dataJSON);
  print(dataMap);
}
```

# REST API Continue
## Penggunaan Method GET
```dart
import 'package:dio/dio.dart';

final Dio dio = Dio();
final Response response = await dio.get('https://reqres.in/api/users');
```

## Penggunakan Method POST
```dart
import 'package:dio/dio.dart';

final Dio dio = Dio();
final Response response = await diot.post(
  'https://reqres.in/api/users',
  data: {
    'name': 'morpheus',
    'job': 'leader'
  }
);
```

## Penggunaan Method PUT
```dart
import 'package:dio/dio.dart';

final Dio dio = Dio();
final Response response = await diot.put(
  'https://reqres.in/api/users/2',
  data: {
    'name': 'morpheus',
    'job': 'zion resident'
  }
);
```

## Penggunaan Method DELETE
```dart
import 'package:dio/dio.dart';

final Dio dio = Dio();
final Response response = await dio.delete('https://reqres.in/api/users/2');
```



















