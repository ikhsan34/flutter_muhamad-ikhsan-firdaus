import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void login(String username) async {
    final SharedPreferences prefs = await _prefs;

    prefs.setString('username', username);
    if(!mounted) return;
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          children: [
            const Text('Login Page'),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: usernameController,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (usernameController.text == 'admin' && passwordController.text == 'admin') {
                        login(usernameController.text);
                      }
                    },
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: const [
                      Text('Use Username: '),
                      Text('admin')
                    ],
                  ),
                  Row(
                    children: const [
                      Text('Use password: '),
                      Text('admin')
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}