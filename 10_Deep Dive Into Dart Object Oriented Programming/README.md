# (10) Deep Dive into Dart Object Oriented Programming

## Constructor
Constructor merupakan method yang dijalankan saat pembuatan object. Constructor menerima parameter dan tidak memiliki return. Nama constructor sama dengan nama class.

### Memberi Constructor
Tambahkan method menggunakan nama yang saam dengan nama class.

Contoh:
```dart
class Hewan {
  var mata;
  var kaki;
  
  Hewan() {
    mata = 0;
    kaki = 0;
  }
}
```

## Inheritance
Inheritance berfungsi untuk membuat class baru dengan memanfaatkan class yang sudah ada. Inheritance bertujuan agar kemampuan class yang sudah ada dapat dimiliki oleh class baru.

### Melakukan Inheritance
Menambahkan syntax **extends** saat pembuatan class baru.

Contoh:
```dart
class Kambing extends Hewan {
  Kambing() {
    mata = 2;
    kaki = 4;
  }
}
```

### Penggunaan Class
Proses membuat object dari class yang terjadi inheritance seperti pembuatan object pada umumnya.
```dart
void main() {
  var k1 = Kambing();
  print(k1.mata);
  
  var h1 = Hewan();
  print(h1.mata);
}
```

## Method Overriding
+ Menulis ulang method yang ada pada super-class
+ Bertujuan agar class memiliki method yang sama tetapi dengan isi proses yang berbeda

### Melakukan Overriding
+ Dilakukan pada class yang melakukan inheritance
+ Method sudah ada pada class induk
+ Method ditulis ulang seperti membuat method baru pada class child
+ Ditambahkan tanda **@override** di baris sebelum method dibuat

```dart
class Hewan {
  reproduksi() {
    print('Tidak diketahui');
  }
  
  bernapas() {
    print('Tidak diketahui');
  }
}

class Kambing extends Hewan {
  @override
  reproduksi() {
    print('melahirkan');
  }
  
  @override
  bernapas() {
    print('paru-paru');
  }
}
```

### Penggunaan Class
Proses membuat object dari class yang terjadi inheritance seperti pembuatan object pada umumnya.
```dart
void main() {
  var k1 = Kambing();
  k1.reproduksi();
  k1.bernapas();
  
  var h1 = Hewan();
  h1.reproduksi();
  h1.bernapas();
}
```

## Interface
+ Berupa class
+ Menunjukan method apa saja yang ada pada suatu class
+ Seluruh method wajib di-override
+ Menggunakan syntax **implements** pada class

### Menggunakan Interface
+ Sekilas mirip inheritance
+ Pada class yang melakukan implements, wajib melakukan override semua method yang ada pada class parent

```dart
class Hewan {
  reproduksi() {
    print('Tidak diketahui');
  }
  
  bernapas() {
    print('Tidak diketahui');
}

class Kambing implements Hewan {
  @override
  reproduksi() {
    print('melahirkan');
  }
  
  @override
  bernapas() {
    print('paru-paru');
  }
}
```

### Penggunaan Class
Proses membuat object dari class yang terjadi inheritance seperti pembuatan object pada umumnya.

```dart
void main() {
  var k1 = Kambing();
  k1.reproduksi();
  k1.bernapas();
  
  var h1 = Hewan();
  h1.reproduksi();
  h1.bernapas();
}
```

Output:
```
melahirkan
paru-paru
Tidak diketahui
Tidak diketahui
```

## Abstract Class
+ Berupa class abstrak
+ Menunjukkan method apa saja yang ada pada suatu class
+ Digunakan dengan menggunakan extends
+ Tidak dapat dibuat object
+ Tidak semua method harus di-override

### Menggunakan Abstract Class

```dart
abstract class Hewan {
  reproduksi() {
    print('Tidak diketahui');
  }
  
  bernapas() {
    print('Tidak diketahui');
}

class Kambing extends Hewan {
  @override
  reproduksi() {
    print('melahirkan');
  }
}
```

### Penggunaan Class

```dart
void main() {
  var k1 = Kambing();
  k1.reproduksi();
  k1.bernapas();
}
```

Output
```
melahirkan
tidak diketahui
```

## Polymorphism
+ Kemampuan data berubah menjadi bentuk lain
+ Tipe data yang dapat digunakan adalah super class
+ Dapat dilakukan pada class dengan extends atau implements

### Melakukan Polymorphism
Object dari class Kambing dengan tipe data class Hewan

```dart
void main() {
  Hewan k1 = Kambing();
  k1.reproduksi();
  k1.bernapas();
}
```

## Generics
+ Dapat digunakan pada class atau fungsi
+ Memberi kemampuan agar dapat menerima data dengan tipe yang berbeda
+ Tipe data yang diinginkan, ditentukan saat membuat class atau menjalankan fungsi

### Membuat Class dengan Generics
+ Class Hadiah dapat dimasukkan data dengan tipe T
+ Tipe T dapat digunakan di seluruh class Hadiah

```dart
class Hadiah<T> {
  var isi;
  
  Hadiah(T i) {
    isi = i;
  }
}
```

### Menggunakan Class dengan Generics
Setelah nama class, menjadi tempat tipe data yang diinginkan.

```dart
void main() {
  var h1 = Hadiah<String>('Mobil');
  print(h1.isi);
  
  var h2 = Hadiah<int>(10);
  print(h2.isi);
}
```

Output
```
mobil
10
```

### Membuat Fungsi dengan Generics
Setelah nama fungsi, menjadi tempat variable generics

```dart
void cekTipe<T>(T data) {
  print(data.runtimeType);
}
```

### Menggunakan Fungsi dengan Generics
Setelah nama fungsi, menjadi tempat tipe data yang diinginkan

```dart
void main() {
  cekTipe<String>('Satu');
  cekTipe<int>(1);
}
```

Output
```
String
int
```
