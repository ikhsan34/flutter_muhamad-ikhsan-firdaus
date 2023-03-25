import 'package:flutter/material.dart';
import 'package:soal_advancedform/prioritas_one.dart';
import 'package:soal_advancedform/prioritas_two.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData().copyWith(
      colorScheme: ThemeData().colorScheme.copyWith(secondary: Colors.black),
      appBarTheme: const AppBarTheme(
        color: Color(0xff6650a5),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xff6650a5))
        )
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Color(0xffe6e0ed),
        labelStyle: TextStyle(
          color: Colors.grey
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey
          )
        ),
      )
    ),
    home: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Advanced Form'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const  PrioritasOne())));
              },
              child: const Text('Soal Prioritas 1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const PrioritasTwo())));
              },
              child: const Text('Soal Prioritas 2'),
            ),
          ],
        ),
      ),
    );
  }
}