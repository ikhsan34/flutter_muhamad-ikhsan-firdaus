# (12) Installation Command Line Interface and Package Management in Flutter

## Flutter CLI
+ Merupakan alat yang digunakan untuk berinteraksi dengan Flutter SDK
+ Perintah dijalankan dalam terminal

  ![image](https://user-images.githubusercontent.com/10411833/221406639-15c70257-2e32-4c7d-be33-64e299d24f2a.png)

## Important CLI Commands
### Flutter Doctor
Perintah untuk menampilkan informasi software yang dibutuhkan flutter
```sh
flutter doctor
```
 ![image](https://user-images.githubusercontent.com/10411833/221406758-d5a4a7c2-b211-4515-804e-6b35835484ba.png)

### Flutter Create
Perintah untuk membuat project aplikasi flutter baru
```sh
flutter create <app_name>
```
 ![image](https://user-images.githubusercontent.com/10411833/221406919-4a84439c-a4f7-4ba6-a7af-4a3a9ffef422.png)
 ![image](https://user-images.githubusercontent.com/10411833/221406935-7ed7a391-65c5-4f77-bebc-db7c63246fce.png)




### Flutter Run
Perintah untuk menjalankan project aplikasi pada device yang tersedia
```sh
fluter run <dart_file>
```

### Flutter Emulator
Perintah untuk menampilkan daftar emulator yang terinstall dan menampilkan option untuk membuka emulator atau membuat emulator baru

```sh
flutter emulators
```
```sh
flutter emulators --launch <emulator_id>
```
```sh
flutter emulators --create [--name xyz]
```
![image](https://user-images.githubusercontent.com/10411833/221407071-7e94a8f0-890e-46cb-9774-7e77838990b0.png)

### Flutter Channel
Perintah untuk menampilkan daftar flutter channel yang tersedia dan menunjukan channel yang digunakan saat ini.
```sh
flutter channel
```

### Flutter Pub
Ada dua syntax yang dapat digunakan, yaitu:
+ Flutter pub add, untuk menambahkan packages ke dependencies yang ada pada file pubspec.yaml
  ```sh
  flutter pub add <package_name>
  ```
+ Flutter pub get, untuk mendownload semua packages atau dependencies yang ada di pubspec.yaml
  ```sh
  flutter pub get
  ```

### Flutter Build
Perintah untuk memproduksi sebuah file aplikasi untuk keperluan deploy atau publish ke Appstore, Playstore, dll.
```sh
flutter build apk
```

### Flutter Clean
+ Perintah untuk menghapus folder build serta file lainnya yang dihasilkan saat kita menjalankan aplikasi di emulator
+ Perintah ini akan memperkecil ukuran project
```sh
flutter clean
```
![image](https://user-images.githubusercontent.com/10411833/221407204-1b885de3-5d49-456b-bfa5-5089ff293889.png)

## packages Management
+ Flutter mendukung sharing packages
+ Packages dibuat oleh developers lain
+ Mempercepat pengembangan aplikasi karena tidak perlu membuat semuanya dari awal atau from scratch
+ Packages dapat didapatkan pada website pub.dev

### Cara menambahkan packages
1. Cari package di pub.dev
2. Copy baris dependencies yang ada di bagian installing
3. Buka pubspec.yaml
4. Paste barisnya di bawah dependencies pubspec.yaml
5. Run *flutter pub get* di terminal
6. Import package di file dart agar bisa digunakan
7. Stop atau restart aplikasi jika dibutuhkan


### Contoh Packages

> flutter_spinkit 5.1.0

```dart
import 'package:flutter_spinkit/flutter_spinkit.dart';

final spinkit = SpinKitFadingCircle(
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: index.isEven ? Colors.red : Colors.green,
      ),
    );
  },
);

```
















