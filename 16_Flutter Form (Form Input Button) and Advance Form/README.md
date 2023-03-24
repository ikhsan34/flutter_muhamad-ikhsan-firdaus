# (16) Flutter Form (Form Input Button) and Advanced Form

# Form Input Button
## Form
Form berfungsi untuk menerima input data dari pengguna. Input yang diisi oleh pengguna bisa lebih dari satu

### Membuat Form
Untuk membuat form harus menggunakan statefulWidget dan state (keadaan) form disimpan menggunakan GlobalKey<FormState>

```dart
var formKey = GlobalKey<FormState>();

Form(
  key: formKey,
  child: inputWidgets,
);
```

## Input

### TextField
TextField merupakan widget kolom input yang dapat diisi oleh data.

#### Membuat TextField
+ Data diambil menggunakan TextEditingController
+ Isian data berupa teks

```dart
var inputController = TextEditingController();

TextField(
  controller: inputController
);
```

### Radio Button
+ Fungsinya untuk memberikan opsi pada pengguna
+ Hanya satu yang dapat dipilih

#### Membuat Radio
+ Data diambil menggunakan property dengan tipe data yang sesuai dengan value pada widget radio.

```dart
var radioValue = '';

Radio<String>(
  value: 'laki-laki',
  groupValue: radioValue,
  onChanged: (String? value) {
    setState(() {
      radioValue = value ?? '';
    });
  }
);
```

### Checkbox
Berfungsi untuk memberikan pilihan pada pengguna dan opsi dapat lebih dari satu.

#### Membuat Checkbox
+ Data diambil menggunakan property bertipe boolean

```dart
var checkValue = false;

Checkbox(
  value: checkValue,
  onChanged: (bool? value) {
    setState(() {
      checkvalue = value ?? false;
    });
  },
);
```

### Dropdown Button
+ Memberikan opsi pada pengguna
+ Hanya dapat memilih satu opsi
+ Opsi tidak ditampilkan di awal, hanya tampil jika ditekan

#### Membuat DropdownButton
Data yang diambil menggunakan property dengan tipe data yang sesuai dengan value pada DropdownMenuItem.

```dart
var dropDownValue = 0;

DropdownButton(
  value: dropdownValue,
  onchanged: (int? value) {
    setState(() {
      dropdownValue = value ?? 0;
    });
  },
  items: const [
    DropdownMenuItem(
      value: 0,
      child: Text('Pilih . . .')
    ),
    DropdownMenuItem(
      value: 1,
      child: Text('Satu')
    ),
    DropdownMenuItem(
      value: 2,
      child: Text('Dua')
    ),
    DropdownMenuItem(
      value: 3,
      child: Text('Tiga')
    ),
  ]
);
```

## Button
+ Bersifat seperti tombol
+ Dapat melakukan sesuatu saat ditekan

### ElevatedButton
+ Tombol yang timbul
+ Jika ditekan, akan menjalankan onPressed

![image](https://user-images.githubusercontent.com/10411833/227534270-b8a95c37-4b48-46f0-9dbf-c6da24450607.png)

```dart
ElevatedButton(
  child: const Text('Submit'),
  onPressed: () {
    // Do something
  },
);
```

### IconButton
+ Merupakan tombol yang hanya menampilkan icon
+ Jika ditekan akan menjalankan onPressed

![image](https://user-images.githubusercontent.com/10411833/227534536-d9596739-a2ee-43bd-943d-db9302f7f799.png)

```dart
IconButton(
  icon: const Icon(Icons.add),
  onPressed: () {
    // Do something
  },
);
```

# Advance Form Input

## Interactive Widgets
+ Interaksi antara aplikasi dan user
+ Mengumpulkan input dan feedback dari user

### Menambahkan Layout
+ Layout untuk menyusun interactive widget
  ``` dart
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Widgets'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: const [
            // buildDatePicker
            // buildColorPicker
            // buildFilePicker
          ]
        ),
      ),
    );
  }
  ```

## Date Picker
+ Widget dimana user bisa memasukan tanggal
+ tanggal kelahiran, waktu pemesanan tiket, waktu reservasi restoran, jadwal meeting, dll.

### Cara Membuat Date Picker
+ Menggunakan fungsi bawaan flutter showDatePicker()
+ Fungsi showDatePicker memiliki tipe data future
+ Menampilkan dialog material design date picker

```dart
final selectDate = await showDatePicker(
  context: context,
  intialDate: currentDate,
  firstDate: DateTime(1990),
  lastDate: DateTime(currentDate.year + 5),
);
```

#### menambahkan package intl di pubspec.yaml

```yaml
dependencies:
  flutter:
    sdk: flutter
  intl: ^0.17.0
```

#### Mempersiapkan variabel
```dart
class _HomePageState extends State<HomePage> {
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
}
```

#### Membangun UI
```dart
Widget buildDatePicker(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Date'),
          TextButton(
            child: const Text('Select'),
            onPressed: () async {
              final selectDate = await showDatePicker(
                context: context,
                initialDate: currentDate,
                firstDate: DateTime(1990),
                lastDate: DateTime(currentDate.year + 5)
              );
              setState(() {
                if(selectDate != null) {
                  _dueDate = selectDate;
                }
              });
            },
          ),
        ],
      ),
      Text(DateFormat('dd-MM-yyyy').format(_dueDate)),
    ]
  );
}
```

#### Hasil akhir
+ Saat button ditekan akan muncul dialog date picker

![image](https://user-images.githubusercontent.com/10411833/227544260-d08dd630-9a79-4e54-b646-82a7b99eff5f.png)

## Color Picker
+ Color Picker merupakan widget dimana user bisa memilih warna
+ Penggunaan color picker bisa digunakan untuk berbagai macam kondisi

### Cara Membuat Color Picker

#### Menambahkan packages flutter_colorpicker di pubspec.yaml
```yaml
dependencies:
  flutter:
    sdk: flutter
  intl: ^0.17.0
  flutter_colorpicker: ^1.0.3
```

#### Mempersiapkan variabel
```dart
Color _currentColor = Colors.orange;
```

#### Membangun UI
```dart
Widget buildColorPicker(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('Color'),
      const SizedBox(height: 10),
      Container(
        height: 100,
        width: double.infinity,
        color: _currentColor,
      ),
      const SizedBox(height: 10),
      Center(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(_currentColor),
          ),
          child: const Text('Pick Color'),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Pick Your Color'),
                  content: BlockPicker(
                    pickerColor: _currentColor,
                    onColorChanged: (color) {
                      setState(() {
                        _currentColor = color;
                      });
                    },
                  ),
                );
              },
            );
          }
        ),
      ),
    ],
  );
}
```

#### Result
![image](https://user-images.githubusercontent.com/10411833/227549799-3dd20a79-3937-4e46-85f3-069b3e38414e.png)

## File Picker
+ Kemampuan widget untuk mengakses storage
+ Memilih dan membuka file

### Cara Membuat File Picker

#### Tambahkan packages file_picker dan open_file
```yaml
dependencies:
  flutter:
    sdk: flutter
  intl: ^0.17.0
  flutter_colorpicker: ^1.0.3
  file_picker: ^4.3.3
  open_file: ^3.2.1
```

#### Import packages pada code
```dart
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
```

#### Membangun UI
```dart
void _openFile(PlatformFile file) {
  OpenFile.open(file.path);
}
```

```dart
void _pickFile() async {
  final result = await FilePicker.platform.pickFiles();
  if(result == null) return;
  
  final file = result.files.first;
  _openFile(file);
}
```

```dart
Widget buildFilePicker() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('Pick Files'),
      const SizedBox(height: 10),
      Center(
        child: ElevatedButton(
          child: const Text('Pick and Open File'),
          onPressed: () {
            _pickFile();
          }
        ),
      ),
    ],
  );
}
```

#### Hasil
![image](https://user-images.githubusercontent.com/10411833/227553260-70b57300-2329-4f5e-ab99-d47573af4294.png)





















