import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soal_animation/bloc/contact_bloc.dart';
import 'package:soal_animation/screens/create_contact.dart';
import 'package:soal_animation/screens/home.dart';
import 'package:soal_animation/screens/update_contact.dart';
import 'package:soal_animation/shared/page_transition.dart';

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
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/create_contact') {
            //return MaterialPageRoute(builder: builder);
            return animateRoute(context, const CreateContact());
          }

          if (settings.name == '/update_contact') {
            final args = settings.arguments as int;

            return animateRoute(context, UpdateContact(index: args));
          }
          
          //return null;
        },
      ),
    );
  }
}
