import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final Future _prefs = SharedPreferences.getInstance();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void login(String username, String password) async {
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(child: Text('Login Page')),
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
                    ElevatedButton(
                      onPressed: () {
                        if (usernameController.text == 'admin' && passwordController.text == 'admin') {
                          login(usernameController.text, passwordController.text);
                        }
                      },
                      child: const Text('Login'),
                    )
                  ],
                ),
              ),
              const Text('Gunakan '),
              const Text('Username: admin'),
              const Text('Password: admin')
            ],
          ),
        ),
      ),
    );
  }
}