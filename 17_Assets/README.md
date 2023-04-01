# (17) Assets

## Assets
Assets merupakan file yang di-bundled dan di-deploy bersamaan dengan aplikasi. Tipe data assets berupa
+ statis data (JSON files)
+ icons
+ images
+ font (.ttf)

### Menentukan Assets
Untuk memasukan assets ke dalam project flutter, dapat melalui pubspec.yaml

```yaml
assets:
  - assets/my_icon.png
  - assets/background.jpg
  - assets/ # Folder
```

## Image
Image atau gambar akan membuat tampilan aplikasi menjadi lebih menraik. Flutter mendukung format gambar seperti JPEG, WebP, GIF, Animated Web/GIF, PNG, BMP dan WBMP. Flutter dapat menampilkan gambar dari local file atau internet.

### Loadings Images
Untuk menampilkan gambar, dapat menggunakan widget Image.

```dart
Image(
  image: AssetImage('assets/background.jpg')
)
```
Atau bisa juga
```dart
Image.asset('assets/background.jpg')
```

Untuk load image dari internet dapat menggunakan
```dart
Image.network('https://picsum.photos/id/1/200/300')
```

## Font
Font dapat menjadi sebuah keunikan pada aplikasi.

Untuk import font dapat dengan menambahkan file font ke dalam folder project kemudian tambahkan pada pubspec.yaml

```yaml
fonts:
  - family: Rowdies
    fonts:
      - asset: fonts/Rowdies-Bold.ttf
      - asset: fonts/Rowdies-Light.ttf
      - asset: fonts/Rowdies-Regular.ttf
```

Pada MaterialApp

```dart
MaterialApp(
  theme: ThemeData(fontFamily: 'Rowdies')
)
```

atau pada textStyle

```dart
Text(
'Text',
style: TextStyle(
  fontSize: 30,
  fontFamily: ''Rowdies
  )
)
```

### Font dari Package
pub.dev terdapat package google_fonts
```yaml
dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^2.2.0
```

Kemudian import package pada file project

```dart
import 'package:google_fonts/google_fonts.dart';
```

```dart
Text(
  'Text',
  style: GoogleFonts.rowdies(fontSize: 30)
)
```
