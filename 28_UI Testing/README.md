# (28) UI Testing

## Pengertian UI Testing
UI Testing merupakan **pengujian** yang dilakukan pada tampilan suatu aplikasi untuk memastikan aplikasi dapat menerima interaksi dan memberi respon kepada pengguna. \
UI Testing pada Flutter disebut juga widget teting sehingga pengujian dilakukan pada widgets dengan menuliskan script yang dapat dijalankan secara otomatis.

### Keuntungan UI Testing
+ Memastikan seluruh widget memberi tampilan yang sesuai
+ Memastikan seluruh interaksi dapat diterima dengan baik
+ Menjadi ketentuan yang harus diikuti saat diperlukan perubahan pada widget

## Melakukan UI Testing

### Instalasi Package Testing
```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
```

### Penulisan Script Testing
+ Dilakukan pada folder test
+ Nama file harus diikuti _test.dart, contoh contact_test.dart

### Penulisan Script Testing
+ Tiap file berisi fungsi main() yang di dalamnya dapat dituliskan script testing
+ Tiap skenario pengujian disebut test case

### Script Testing
+ Test case diawali dengan testWidgets dan diberi judul
+ Simulasi proses mengaktifkan halaman AboutScreen
+ Memerika apakah di halaman tersebut terdapat teks "About Screen"
```dart
testWidgets('Judul halaman harus About Screen', (WidgetTester tester)) async {
  await tester.pumpWidget(
    const MaterialApp(
      home: AboutScreen()
    )
  );
  
  expect(find.text('About Screen'), findsOneWidget);
}
```

### Menjalankan Testing
+ Perintah **flutter test** akan menjalankan seluruh file test yang dibuat
+ Hasil dari perintah ini adalah lamanya waktu pengujian, total pengujian yang dilakukan dan pesan bahwa pengujian berhasil

![image](https://user-images.githubusercontent.com/10411833/232256627-5dc2159e-5f50-4711-a5b2-d55c828b5b0d.png)













