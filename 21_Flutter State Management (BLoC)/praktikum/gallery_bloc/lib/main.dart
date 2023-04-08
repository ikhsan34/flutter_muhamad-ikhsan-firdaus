import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_bloc/bloc/image_bloc.dart';
import 'package:gallery_bloc/screens/dashboard_screen.dart';
import 'package:gallery_bloc/screens/detail_image_screen.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ImageBloc(),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const DashboardScreen()
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/detail_image_screen') {
            final args = settings.arguments as int;

            return MaterialPageRoute(
              builder: (context) => DetailImageScreen(index: args),
            );
          }
          return null;
        },
      ),
    )
  );
}
