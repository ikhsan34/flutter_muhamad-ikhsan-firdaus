import 'package:flutter/material.dart';

class ViewImage extends StatelessWidget {
  
  final String name;
  final String image;

  const ViewImage({super.key, required this.image, required this.name});
  //const ViewImage({super.key});

  @override
  Widget build(BuildContext context) {

    //final args = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Column(
          children: [
            Image(image: AssetImage(image), width: double.infinity)
          ],
        ),
      ),
    );
  }
}