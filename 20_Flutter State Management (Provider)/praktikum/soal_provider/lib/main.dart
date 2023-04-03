import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soal_provider/arguments/create_contact_arguments.dart';
import 'package:soal_provider/create_contact.dart';
import 'package:soal_provider/dashboard.dart';
import 'package:soal_provider/contact.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Contacts())
    ],
    child: MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(secondary: const Color(0xff6650a5)),
        appBarTheme: const AppBarTheme(
          color: Color(0xff6650a5),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xff6650a5))
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
      initialRoute: '/',
      routes: {
        '/':(context) => const Dashboard(),
        //'/create_contact':(context) => const CreateContact()
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/create_contact') {
          final args = settings.arguments as CreateContactArguments;

          return MaterialPageRoute(
            builder: (context) {
              return CreateContact(contactName: args.contactName, contactPhone: args.contactPhone);
            },
          );
        }
        return null;
      },
      // home: const MyApp(),
    ),
  ));
}
