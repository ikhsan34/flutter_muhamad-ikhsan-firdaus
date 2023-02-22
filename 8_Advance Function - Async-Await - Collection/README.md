# (8) Advance Function - Async-Await - Collection

## Fungsi Lanjutan (Function)

### Anonymous Function
+ Anonymous function tidak memiliki nama
+ Anonymous function bisa kita buat sebagai data di parameter

Penulisan Anonymous function
```dart
() {
  // Perintah yang dijalankan saat fungsi dipanggil
}
```

Contoh:
```dart
var hello = () {
  print('hello');
};

var jumlah = (int a, int b) {
  return a + b;
}

void main() {
  hello();
  print(jumlah(1, 2));
}
```

### Arrow Function
Arrow function sama seperti anonymous function.
+ Dapat memiliki nama atau tidak
+ Berisi 1 data (dari proses maupun data statis)
+ Nilai return fungsi ini diambil dari data tersebut

Penulisan arrow function
```dart
() => proses_yang_dijalankan();
```

Contoh:
```dart
var hello = () => print('hello');
var jumlah = (int a, int b) => a + b;

void main() {
  hello();
  print(jumlah(1, 2));
}
```

+ Fungsi hello melakukan print di dalamnya
+ Fungsi jumlah memberi nilai saat dijalankan sehingga dapat dilakukan print

## Async Await

### Pengertian
+ Async merupakan fitur pada sebuah function
+ Async dapat menjalankan beberapa proses tanpa perlu menunggu
+ proses ditulis dalam bentuk fungsi
+ await akan menunggu hingga proses async selesai

### Simulasi

Contoh:
```dart
void P1() {
  Future.delayed(Duration(seconds: 1), () {
    print('hello dari P1');
  };
}

void P2() {
  print('hello dari P2');
}

void main() {
  P1();
  P2();
}
```

Output:
```sh
hello dari P2
hello dari P1
```

Dapat dilihat dari hasil output, walaupun function P1 dipanggil terlebih dahulu, namun karena ada delay selama 1 detik maka function P2 yang menampilkan output terlebih dahulu karena tidak memiliki delay.

Contoh 2:
```dart
Future<void> P1() async {
  await Future.delayed(Duration(seconds: 1), () {
    print('hello dari P1');
  };
}

void P2() {
  print('hello dari P2');
}

void main() async {
  await P1();
  P2();
}
```
Output:
```sh
hello dari P1
hello dari P2
```

Ketika kita menggunakan fitur async pada function, maka kode yang dijalankan akan menunggu fungsi yang menggunakan fitur await.

## Collection
Collection merupakan struktur data yang lebih canggih untuk menangani masalah yang lebih kompleks. Collection bisa menyimpan kumpulan data atau objek lain pada suatu tempat.

### List
Collection yang pertama yaitu **List** yang dapat menyimpan data secara berbaris. Tiap data pada **List** memiliki nomor index.
![list](https://static.javatpoint.com/tutorial/dart/images/dart-lists.png)

Contoh penulisan List:
```dart
void main() async {
  var scores = [];
  scores.add(60);
  scores.add(80);
  scores.add(90);
  scores.add(70);
  scores.add(85);
  print(scores);
  
  print(scores[0]);
  print(scores[1]);
  print(scores[2]);
  print(scores[3]);
  print(scores[4]);
  
}
```

Tiap data pada list juga dapat diambil menggunakan perulangan **loop**
```dart
void main() async {
  var scores = [60, 80, 90, 70, 85];
  print(scores);
  
  for(var score in scores) {
    print(score);
  }
}
```

### Map
Collection map menyimpan data dengan format key-value dimana key berfungsi selayaknya index pada list.

| key | value |
| --- | --- |
| key1 | value1 |
| key2 | value2 |
| key3 | value3 |
| key4 | value4 |
| key5 | value5 |

Contoh:
```dart
void main() async {
  var student = {};
  student['name'] = 'Alex Under';
  student['age'] = 16;
  
  print(student);
  print(student['name']);
  print(student['age']);
}
```

Output:
```sh
{name: Alex Under, age: 16}
Alex Under
16
```

Contoh 2:
```dart
void main() async {
  var student = {
    'name': 'Alex Under',
    'age': 16
  };
  print(student);
  
  // Mengambil semua data pada map menggunakan loop
  for(var key in student.keys) {
    print(student[key]);
  }
}
```
