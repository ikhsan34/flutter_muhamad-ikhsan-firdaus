# (11) Introduction Flutter Widget

## Perkenalan Flutter
![flutter_icon](https://miro.medium.com/max/320/0*ObJbOfJnx4QIPUq9.png)


### Apa itu flutter? 
Flutter merupakan alat pengembangan antarmuka pengguna yang digunakan untuk membuat aplikasi mobile, desktop, dan web.

### Keunggulan Flutter
+ Mudah digunakan dan dipelajari
+ Produktivitas tinggi
+ Dokumentasi lengkap
+ Komunitas yang berkembang

### Bagian dari Flutter
+ Software Development Kit (SDK), alat untuk membantu proses pengembangan aplikasi
+ Framework, perlengkapan untuk membentuk aplikasi yang dapat dikustomisasi

### Membuat Project
Dapat dilakukan dengan menjalankan perintah:
```sh
flutter create <nama_project>
```

Contoh:
```sh
flutter create phonebookapp
```

### Menjalankan Project
+ Masuk ke direktori project
+ Jalankan perintah
  ```sh
  flutter run
  ```

### Struktur Direktori
![image](https://user-images.githubusercontent.com/10411833/221402959-09bb5dfb-bf85-4acf-ad1f-177d11208ef9.png)

direktori platform:
+ android
+ ios
+ web

Direktori project:
+ lib, ruang kerja utama
+ test, aktivitas pengujian

### File Utama
File utama bernama **main.dart** yang memiliki fungsi main dan dapat menjalankan aplikasi dengan fungsi **runApp**. File **main.dart** berada dalam direktori lib.

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());
```

## Widget
Widget berfungsi untuk membentuk antarmuka (UI). Widget berupa class dan dapat terdiri dari beberapa widget lainnya.
### Jenis
+ Stateless Widget
+ Stateful Widget

### Stateless Widget
+ Tidak bergantung pada perubahan data
+ Hanya fokus pada tampilan
+ Dibuat dengan extends pada class StatelessWidget

#### Membuat Stateless Widget

```dart
class Frog extends StatelessWidget {
  const Frog({
    super.key,
    this.color = const Color(0xFF2DBD3A),
    this.child,
  });

  final Color color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(color: color, child: child);
  }
}
```

### Staeful Widget
+ Mementingkan pada perubahan data
+ Dibuat dengan extends pada class StatefulWidget
+ 1 widget menggunakan 2 class (widget dan state)

#### Membuat Stateful Widget

```dart
class Bird extends StatefulWidget {
  const Bird({
    super.key,
    this.color = const Color(0xFFFFE306),
    this.child,
  });

  final Color color;
  final Widget? child;

  @override
  State<Bird> createState() => _BirdState();
}

class _BirdState extends State<Bird> {
  double _size = 1.0;

  void grow() {
    setState(() { _size += 0.1; });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
      transform: Matrix4.diagonal3Values(_size, _size, 1.0),
      child: widget.child,
    );
  }
}
```

### Built int Widget
+ Widget yang dapat langsung digunakan
+ Sudah terinstall bersama Flutter

#### MaterialApp
Membangun aplikasi dengan desain material.
```dart
const MaterialApp();
```

```dart
const MaterialApp(
  home: const Text('Selamat datang di Flutter.'),
);
```

#### Scaffold
Berfungsi untuk membentuk sebuah halaman.

```dart
const Scaffold();
```

```dart
const Scaffold(
  body: const Text('Selamat datang di Flutter.');
);
```

#### AppBar
Berfungsi untuk membentuk *application bar* yang terletak pada bagian atas halaman.

```dart
AppBar();
```

```dart
AppBar(
  title: const Text('Home'),
);
```

#### Text
Berfungsi untuk menampilkan teks.

```dart
const Text(teks);
```

```dart
const Text('Haloooo...');
```

#### Result

```dart
@override
Widget build(BuildContext context) {
  return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
    body: const Text('Selamat datang di Flutter.'),
    ),
  );
}
```

![image](https://user-images.githubusercontent.com/10411833/221404130-a2faf1b3-c8d5-4d2a-8974-01d96867f1b4.png)



















