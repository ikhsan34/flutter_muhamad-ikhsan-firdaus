# (6) Fundamental Dart

## Apa itu Dart?
Dart merupakan bahasa pemrograman yang open source yang dirancang untuk membuat aplikasi agar dapat berjalan dengan cepat. Dart dikembangkan oleh google yang awalnya dikenalkan pada tahun 2011. Project ini didirikan oleh Lars Bak dan Kasper Lund.

Tujuan awal pengembangan bahasa Dart yaitu untuk menggantikan Javascript karena dinilai banyak kelemahan. Sejak munculnya framework Flutter, Dart semakin populer karena penggunaannya pada Flutter yang dapat mengembangkan aplikasi yang berjalan pada sisi client atau Front End seperti Web, Desktop atau Mobile.

## Kenapa harus Dart?
Dart memiliki kesamaan dengan bahasa pemrograman lain seperti Java, Python, C#, Swift dan Kotlin. Beberapa fitur yang dimiliki Dart yaitu:
+ Type safe, yang menjamin konsistensi tipe data
+ Null safety, yang memberi keamanan dari data bernilai hampa (null)
+ Rich standard library, yang hadir dengan banyak dukungan library internal
+ Multiplatform, yang mampu berjalan ada berbagai jenis perangkat

## Dasar Pemrograman Dart
### Program Dart Sederhana
Sama seperti Java, pada Dart juga terdapat fungsi main. Contohnya seperti:

```dart
void main() {
	print('Selamat Datang di Bahasa Pemrograman Dart!');
}
```

+ Fungsi main
	+ Merupakan bagian yang dijalankan pertama kali
	+ Dapat memiliki tipe data void atau int 
	+ Memiliki nama **main**
+ Perintah **print** digunakan untuk menampilkan data ke layar

### Komentar
Yaitu baris kode yang tidak dijalankan dengan tujuan:
+ Memberi catatan pada kode
+ Mencegah perintah ketika program dijalankan

Cara pertama menulis komentar:

```dart
void main() {
	// ini komentar
	// selalu diawali tanda garis miring 2 kali
	print('Selamat Datang di Bahasa Pemrograman Dart!');
}
```

Cara kedua menulis komentar:

```dart
void main() {
	/* 
	ini komentar
	selalu diawali tanda garis miring 2 kali
	*/
	print('Selamat Datang di Bahasa Pemrograman Dart!');
}
```

### Variable
Variable digunakan untuk menyimpan data yang memiliki nama dan memiliki tipe data.

Deklarasi variable diawali dengan tipe data kemudian dilanjut dengan nama variable yang diinginkan.

```dart
int score;
```

Deklarasi menggunakan **var** dan diikuti dengan nama variable secara otomatis tipe data variable tersebut adalah **Null**.

```dart
void main(){
	var usia;
}
```

Deklarasi dan memberi nilai variable secara bersamaan.
```dart
void main() {
	var usia = 18;
}
```

### Konstanta
Konstanta berfungsi untuk:
+ Digunakan untuk menyimpan data
+ Memiliki nama
+ Memiliki tipe data
+ Nilai tetap (tidak dapat diubah)

Konstanta dapat menggunakan final kemudian diikuti nama dan diberikan nilai secara langsung.

```dart
void main() {
	final usia = 18;
}
