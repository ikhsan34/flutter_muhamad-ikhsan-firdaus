import 'package:file_picker_provider/models/transition_model.dart';
import 'package:file_picker_provider/views/image_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:file_picker_provider/view_models/image_provider.dart' as image_provider;
import 'package:file_picker_provider/views/image_detail_view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_) => image_provider.ImageProvider(),)
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[200]
        ),
        initialRoute: '/',
        routes: {
          '/':(context) => const ImageView(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/image_detail') {
            final args = settings.arguments as int;

            // Navigation with Transition
            return TransitionModel(nextPage: ImageDetailView(index: args)).nextRoute(settings);

            // return MaterialPageRoute(
            //   builder: (context) {
            //     return ImageDetailView(index: args);
            //   },
            // );
          }
          return null;
        },
      ),
    )
  );
}