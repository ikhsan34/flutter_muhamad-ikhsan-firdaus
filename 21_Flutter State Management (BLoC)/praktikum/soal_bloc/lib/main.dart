import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soal_bloc/bloc/contact_bloc.dart';
import 'package:soal_bloc/screens/create_contact.dart';
import 'package:soal_bloc/screens/home.dart';
import 'package:soal_bloc/screens/update_contact.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ContactBloc>(
          create: (context) => ContactBloc(),
        )
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const Home(),
          '/create_contact':(context) => const CreateContact()
        },
        onGenerateRoute: (settings) {
        if (settings.name == '/update_contact') {
          final args = settings.arguments as int;

          return MaterialPageRoute(
            builder: (context) {
              return UpdateContact(index: args);
            },
          );
        }
        return null;
      },
      ),
    );
  }
}
