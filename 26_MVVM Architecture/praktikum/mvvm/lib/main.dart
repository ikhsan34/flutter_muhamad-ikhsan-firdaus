import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mvvm/arguments/create_contact_arguments.dart';
import 'package:mvvm/screens/contact/create_contact_screen.dart';
import 'package:mvvm/screens/dashboard.dart';
import 'package:mvvm/screens/contact/contact_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ContactProvider())
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
                return CreateContactScreen(contactName: args.contactName, contactPhone: args.contactPhone);
              },
            );
          }
          return null;
        },
        // home: const MyApp(),
      ),
    );
  }
}
