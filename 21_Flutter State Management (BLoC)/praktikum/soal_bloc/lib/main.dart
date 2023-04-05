import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soal_bloc/bloc/contact_bloc.dart';
import 'package:soal_bloc/screens/create_contact.dart';
import 'package:soal_bloc/screens/home.dart';

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
          '/': (context) => const Home()
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
      ),
    );
  }
}
