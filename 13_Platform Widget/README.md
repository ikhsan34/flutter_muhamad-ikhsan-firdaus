# (13) Platform Widget

## Abstract
Memanfaatkan widget dengan gaya berbeda pada Android dan iOS.

![image](https://user-images.githubusercontent.com/10411833/222014366-25c34c16-4c94-466b-b0f3-ae6ae064aca9.png)

## MaterialApp
+ Widget dasar yang mengemas seluruh widget dalam aplikasi
+ Widget yang digunakan pada sistem Android
+ Di-import dari package:flutter/material.dart

### Struktur
Widget yang pertama kali dibuka diletakkan pada bagian home.

```dart
MaterialApp(
  theme: ThemeData.dark(),
  home: const HomePage()
);
```

Mengatur halaman juga dapat dilakukan dengan menggunakan routes dan initialRoute.

```dart
MaterialApp(
  theme: ThemeData.dark(),
  intialRoute: 'home',
  routes: {
    'home': (_) => const HomePage(),
  },
);
```

## Scaffold
Scaffold merupakan widget dasar untuk membangun sebuah halaman pada MaterialApp.

![image](https://user-images.githubusercontent.com/10411833/222014852-f1f0e181-560d-4116-b708-67fdce173458.png)

### Struktur
Membentuk tata letak dasar sebuah halaman yang ditulis melalui properti-properti.

```dart
Scaffold(
  appBar: AppBar(...),
  drawer: Drawer(...),
  body: ...,
  bottomNavigationBar: BottomNavigationBar(...),
);
```

#### Scaffold
![image](https://user-images.githubusercontent.com/10411833/222015117-893995da-8a6d-4aa5-b23a-3256e624ae19.png)

#### Drawer
![image](https://user-images.githubusercontent.com/10411833/222015167-2e1f75c6-bc2e-4eb7-accf-bbd357fdc012.png)


## CupertinoApp
+ Merupakan widget dasar yang mengemas seluruh widget dalam aplikasi
+ Widget yang digunakan pada sistem iOS
+ Di-import dari package:flutter/cupertino.dart

### Struktur
+ Variable _themeDark dibuat untuk menyimpan tema
+ Diperlukan karena Cupertino tidak menyediakan ThemeData.dark() seperti pada MaterialApp

```dart
final _themeDark = const CupertinoThemeData.raw(
  Brightness.dark,
  null,
  null,
  null,
  null,
  null,
);
```

Widget yang pertama kali dibuka diletakkan pada bagian **home**.

```dart
CupertinoApp(
  theme:_themeDark,
  home: const HomePage(),
);
```

## CupertinoPageScaffold
Merupakan widget dasar untuk membangun sebuah halaman pada CupertinoApp

### Struktur
Membentuk tata letak dasar sebuah halaman yang ditulis melalui properti-properti

```dart
CupertinoPageScaffold(
  navigationBar: CupertinoNavigationBar(...),
  child: ...
);
```

#### CupertinoPageScaffold
![image](https://user-images.githubusercontent.com/10411833/222015763-b9204e0f-45c7-4b64-afff-48daf1994e33.png)


















