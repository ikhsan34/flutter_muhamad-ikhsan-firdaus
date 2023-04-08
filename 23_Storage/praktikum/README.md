# (21) Praktikum Storage

## Simple Login

### Login Page
<img src="https://user-images.githubusercontent.com/10411833/230741463-d5dc4b4f-8c56-4c5f-b626-452e4b43b7c7.png" height=600>

### Home Page
<img src="https://user-images.githubusercontent.com/10411833/230741466-6cdb7a1a-926d-4ae4-91cb-1ea0f53a9cbf.png" height=600>

### Code Highlight
#### Login
##### Login Button
```dart
ElevatedButton(
  onPressed: () {
    if (usernameController.text == 'admin' && passwordController.text == 'admin') {
      login(usernameController.text);
    }
  },
  child: const Text('Login'),
)
```
##### Login Function
```dart
void login(String username) async {
  final SharedPreferences prefs = await _prefs;

  prefs.setString('username', username);
  if(!mounted) return;
  Navigator.pushReplacementNamed(context, '/');
}
```

#### Logout
```dart
void logout() async {
  final SharedPreferences prefs = await _prefs;
  prefs.clear();
  isLoggedIn();
}
```
