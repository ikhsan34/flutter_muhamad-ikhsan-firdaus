# (19) Flutter Navigation

## Apa itu Navigation
Navigation merupakan fungsi untuk berpindah dari halaman satu ke halaman yang lain pada aplikasi. 

## Navigation Dasar
+ Navigator.push() // untuk berpindah halaman
+ Navigator.pop() // untuk kembali ke halaman sebelumnya

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondRoute()),
            );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
```

### Mengirim Data ke Halaman Baru
Untuk mengirim data, dapat menggunakan parameter pada constructor.

```dart
class SecondRoute extends StatelessWidget {
  final String parameter; // <----- Parameter
  const SecondRoute({super.key, required this.parameter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
```

## Navigation dengan Named Routes
Tiap halaman memiliki alamat yang disebut route.
+ Navigator.pushNamed(); // untuk berpindah halaman
+ Navigator.pop(); // Untuk kembali

### Mendaftarkan Route
Tambahkan initialRoute dan routes pada MaterialApp

```dart
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (_) => const HomeScreen(),
    '/about': (_) => const AboutScreen(),
  },
);
```

### Untuk berpindah dapat menggunakan

```dart
Navigator.of(context).pushNamed('/about');
```

### Mengirim Data ke Halaman Baru
Untuk mengirim data, dapat menggunakan arguments saat melakukan pushNamed.

```dart
Navigator.of(context).pushNamed(
  '/about',
  arguments: 'Hore',
);
```

Kemudian pada halaman tujuan, arguments dapat disimpan pada

```dart
final parameter = ModalRoute.of(context)!.settings.arguments as String;
```








