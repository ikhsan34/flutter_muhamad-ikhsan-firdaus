# (7) Branching - Looping - Function

## Pengambilan Keputusan
Pengambilan keputusan berfungsi untuk menentukan alur program pada kondisi tertentu atau bisa disebut juga *control flow*.

### IF
+ Memerlukan nilai bool (dari operator logical atau comparison)
+ Menjalankan bagian proses jika nilai bool bernilai true

Kondisi **IF** dapat dituliskan sebagai berikut:

```dart
if(nilai_bool) {
	// Proses jika nilai_bool adalah true
}
```

Contoh penggunaan **IF**:

```dart
void main(){
	var usia = 18;
	if(usia < 20) {
		print('Remaja');
	}
}
```

Penjelasan dari kode diatas yaitu, jika usia kurang dari 20, maka ditampilkan **Remaja** pada layar.

### IF-ELSE
Keyword **else** berjalan ketika block code **if** terlewatkan karena kondisinya bernilai false. Keyword **else** dapat ditambahkan setelah block kode **if**.

Penulisan IF-ELSE:

```dart
if(nilai_bool) {
	// Proses jika nilai_bool adalah true
} else {
	// Proses jika nilai_bool adalah false
}
```

Contoh penggunaan **IF-ELSE**:

```dart
void main(){
	var usia = 18;
	if(usia < 20) {
		print('Remaja');
	} else {
		print('tidak memiliki golongan');
	}
}
```

Berdasarkan kode di atas, jika usia tidak memenuhi kondisi, maka ditampilkan **tidak memiliki golongan** pada layar.

### IF - ELSE IF
Kondisi juga dapat dicheck sekaligus dengan menggabungkan keyword *else* dan *if*. **ELSE IF** berjalan ketika kondisi if diatasnya itu bernilai false dan kemungkinan kondisi lainnya true.

Penulisan **IF - ELSE IF**:

```dart
if(nilai_bool) {
	// Proses jika nilai_bool adalah true
} else if (nilai_bool2) {
	// Proses jika nilai_bool adalah false dan
	// Proses jika nilai_bool2 adalah true
}
```

Contoh penggunaan **IF - ELSE IF**:

```dart
void main(){
	var usia = 18;
	if(usia < 20) {
		print('Remaja');
	} else if(usia < 40){
		print('Dewasa');
	} else {
		print('tidak memiliki golongan');
	}
}
```

## Perulangan
Perulangan dapat digunakan ketika ingin menjalankan proses yang sama berkali-kali.

### For
+ Diketahui berapa kali perulangan akan terjadi
+ Memerlukan nilai awal
+ Memerlukan nilai bool, jika true maka perulangan dilanjutkan
+ Memerlukan pengubah nilai

Penulisan **for**:
```dart
for(nilai_awal; nilai_bool; pengubah_nilai_awal) {
	// proses berulang jika nilai_bool adalah true
}
```

Contoh penggunaan **for**:
```dart
void main() {
	for(var i = 0; i < 10; i++) {
		print(i);
	}
}
```

Penjelasan:
+ i merupakan nilai awal
+ i < 10 merupakan kondisi true
+ i++ merupakan pengubah nilai

### While
+ Tidak diketahui berapa kali perulangan akan terjadi
+ Memerlukan nilai bool, jika true maka perulangan dilanjutkan

Penulisan **while**:
```dart
while(nilai_bool) {
	// proses berulang jika nilai_bool adalah true
}
```

Contoh **while**:
```dart
void main() {
	var i = 0;
	while(i < 10) {
		print(i);
		i++;
	}
}
```

### Do-While
+ Kondisi mirip seperti perulangan **while**
+ Proses dijalankan minimum sekali, akan diteruskan jika nilai bool adalah true

Penulisan **do-while**:
```dart
do {
	// proses berulang jika nilai_bool adalah true
} while(nilai_bool);
```

Contoh **do-while**:
```dart
void main() {
	var i = 0;
	do {
		print(i);
		i++;
	} while(i < 10);
}
```

## Break and Continue
+ Perulangan menggunakan nilai bool untuk lanjut atau berhenti
+ Break dan Continue dapat menghentikan perulangan dengan mengabaikan nilai bool
+ Continue dapat menghentikan satu kali proses

### Perbedaan Break dan Continue

| Break | Continue |
| --- | --- |
| Menghentikan seluruh proses perulangan | Menghentikan satu kali proses perulangan |

### Examples
Contoh **Break**:
```dart
void main() {
	for (var i = 0; true; i++) {
		if(i == 10) {
			break;
		}
	}
}
```

Contoh **Continue**:
```dart
void main() {
	for (var i = 0; i < 10; i++) {
		if(i == 5) {
			continue;
		}
		print(i);
	}
}
```

## Function (Fungsi)
Function merupakan kumpulan perintah atau prosedur yang dapat digunakan ulang atau dipanggil berkali-kali. Cukup mengubah fungsi sekali, maka penggunaan fungsi tersebut akan ikut berubah.

### Cara Membuat Function

Penulisan **function**:
```dart
tipe_data nama_fungsi() {
	// perintah yang dijalankan saat fungsi dipanggil
}
```

Contoh **function**:
```dart
void halo() {
	print('halo');
}
```

### Memanggil Function

Penulisan untuk memanggil **function**:
```dart
nama_fungsi();
```

Contoh pemanggilan **function**:
```dart
void main() {
	halo();
}
```

### Fungsi Dengan Parameter
Parameter adalah input data yang dapat dikirimkan kepada function.

Penulisan **function** dengan parameter:
```dart
tipe_data nama_fungsi(tipe_data nama_parameter) {
	// perintah yang dijalankan saat fungsi dipanggil
}
```

Contoh **function** dengan parameter:
```dart
void tampil(String teks) {
	print(teks);
}

void main() {
	tampil('halo');
}
```

### Fungsi Dengan Return
Fungsi juga dapat menghasilkan output atau mengembalikan nilai. Keyword void harus diubah menjadi tipe data yang ingin dijadikan output.

Penulisan **function** dengan return:
```dart
tipe_data nama_fungsi(tipe_data nama_parameter) {
	// perintah yang dijalankan saat fungsi dipanggil
	return nilai;
}
``` 

Contoh **function** dengan return:
```dart
int jumlah(int a, int b) {
	return a + b;
}

void main() {
	var hasil = jumlah (1, 2);
	print(hasil);
}
```