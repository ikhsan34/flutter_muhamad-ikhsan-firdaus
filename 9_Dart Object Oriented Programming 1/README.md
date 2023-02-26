# (9) Dart Object Oriented Programming 1

## Perkenalan Object Oriented Programming
Object Oriented Programming adalah paradigma pemrograman yang berkonsep object. Kita dapat memvisualisasikan object yang ada di dunia nyata kedalam program komputer.
+ Biasa disebut OOP
+ Program disusun dalam bentuk abstraksi object, dimana kita bisa menampilkan atribut atau properti yang relevan saja dan menyembunyikan detailnya
+ Data dan proses diletakkan pada abstraksi tersebut

Keuntungan OOP:
+ Mudah di-troubleshoot
+ Mudah digunakan ulang

Selain **Dart**, penggunaan OOP juga bisa kita temukan pada bahasa pemrograman lain, seperti:
+ C++
+ Java
+ Javascript
+ Python

OOP memiliki beberapa komponen yang perlu kita ketahui, antara lain:
+ Class
+ Object
+ Property
+ Method
+ Inheritance
+ Generics

## Class
Class merupakan abstraksi, gambaran, atau blueprint dari sebuah benda (object). Class memiliki ciri-ciri yang disebut property. Class juga memiliki sifat dan kemampuan yang disebut method.

### Membuat Class
+ Menggunakan kata kunci *class*
+ Memiliki nama yang diawali dengan huruf besar
+ Detail *class* diletakkan dalam kurawal

```dart
class Hewan {
  // Property
  // Method
}
```

### Membuat Object
Dari *class* yang kita buat, kita dapat membuat object berdasarkan *class* tersebut. Object merupakan:
+ Bentuk sebenarnya dari class
+ Disebut juga instance of class
+ Diperlakukan seperti data

```dart
void main() {
  var h1 = Hewan();
  var h2 = Hewan();
  var h3 = Hewan();
}
```

## Property
+ Merupakan ciri-ciri suatu class
+ Merupakan hal-hal yang dimiliki suatu class
+ Property memiliki sifat seperti variable

### Membuat Property
Properti merupakan variable tetapi terletak dalam sebuah class.

Contoh:
```dart
class Hewan {
  var mata = 0;
  var kaki = 0;
}
```

### Mengakses Property
Seperti menggunakan variable tetapi melalui sebuah object.

Contoh:
```dart
void main() {
  var h1 = Hewan();
  print(h1.mata);
}
```

## Method
Method merupakan sifat atau prilaku dari sebuah class. Method memiliki aktivitas yang dapat dikerjakaan suatu class. Method juga memiliki sifat yang sama seperti fungsi (function).

### Membuat Method
Seperti fungsi tetapi terletak dalam sebuah class.

Contoh:
```dart
class Hewan {
  void bersuara() {
    print('Meow');
  }
}
```

### Menjalankan Method
Seperti memanggil fungsi, tetapi melalui object.

Contoh:
```dart
void main() {
  var h1 = Hewan();
  h1.bersuara();
}
```


