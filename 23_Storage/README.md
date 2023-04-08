# (21) Storage

## Penyimpanan Lokal
+ Diperlukan untuk efisiensi penggunaan data internet
+ Ada beberapa cara implementasi penyimpanan lokal, contohnya seperti:
  + Shared Preferences
  + Local Database

### Shared Preferences
+ Menyimpan data yang sederhana
+ Penyimpanan dengan format key-value
+ Menyimpan tipe data dasar seperti teks, angka dan boolean
+ Contoh penggunaan shared preferences seperti menyimpan data login dan menyimpan riwayat pencarian

#### Implementasi Shared Preference
1. Tambahkan package shared_preference
```yaml
dependencies:
  shared_preferences: ^2.0.12
```

2. Buat properti baru untuk TextEditingController dan tambahkan di setiap TextFormField
```dart
final _nameController = TextEditingController();
final _emailController = TextEditingController();
final _passwordController = TextEditingController();
```

3. Buat method dispose() untuk menghindari kebocoran memori
```dart
@override
void dispose() {
  _nameController.dispose();
  _emailController.dispose();
  _passwordController.dispose();
}
```

4. Buat variabel baru untuk menyimpan SharedPreference dan nilai bool newUser
```dart
late SharedPreferences loginData;
late bool newUser;
```

5. Buat method baru dengan nama method checkLogin()
```dart
void checkLogin() async {
  loginData = await SharedPreferences.getInstance();
  newUser = loginData.getBool('login') ?? true;
  
  if(newUser == false) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage()
      ),
      (route) => false
    );
  }
}
```

6. Panggil method checkLogin() di method initState()
```dart
@override
void inistate() {
  super.initState();
  checkLogin();
}
```

7. Pada onPressed ElevatedButton, buat variabel baru username untuk menampung input dari user dan buat setBool dan SetString baru di dalam blok kode if dan buat navigasi untuk ke halaman HomePage()
```dart
() {
  final isValidForm = formKey.currentState!.validate();
  
  String username = _nameController.text;
  if(isValidForm) {
    loginData.setBool('login', false);
    loginData.setString('username', username);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage()
      ),
      (route) => false
    );
  }
}
```
8. buat variabel untuk menyimpan SharedPreference dan username;
```dart
late SharedPreferences loginData;
String username = '';
```

9. buat method baru initial dan panggil di method iniState()
```dart
void initial() async {
  loginData = await SharedPreferences.getInstance();
  setState(() {
    username = loginData.getString('username').toString();
  });
}

@override
void initState() {
  super.initState();
  initial();
}
```

10. UI
```dart
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page')
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Selamat Datang!'),
            const SizedBox(height: 20),
            Text(username),
            ElevatedButton(
              onPressed: () {
                loginData.setBool('login', true);
                loginData.remove('username');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              child: const Text('Logout')
            ),
          ]
        )
      )
    );
  }
}
```

### Local Database (SQLite)
+ Menyimpan dan meminta data dalam jumlah besar pada local device
+ Bersifat privat
+ Menggunakan SQLite database melalui package sqflite
+ SQLite adalah database opensource yang mendukung insert, read, update dan remove data
