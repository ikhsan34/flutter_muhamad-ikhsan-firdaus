import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool isLoading = false;
  Widget? imageSvg;
  final List imageStyles = [
    'adventurer',
    'adventurer-neutral',
    'avataaars',
    'avataaars-neutral',
    'big-ears',
    'big-ears-neutral',
    'big-smile',
    'bottts'
  ];

  void getImage() async {

    setState(() {
      isLoading = true;
    });

    final dio = Dio();
    int randomIndex = Random().nextInt(imageStyles.length);

    try {
      final response = await dio.get('https://api.dicebear.com/6.x/${imageStyles[randomIndex]}/svg?seed=John');

      if (response.statusCode == 200) {
        setState(() {
          isLoading = false;
          imageSvg = SvgPicture.string(response.data, height: 200);
        });
      }
      
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image API - DiceBear'),
      ),
      body:  Center(
        child: isLoading
        ? const CircularProgressIndicator()
        : Column(
          children: [
            imageSvg != null ? imageSvg! : const Text('Tap On Generate Button'),
            ElevatedButton(
              onPressed: () {
                getImage();
              },
              child: const Text('Generate Random Image'),
            )
          ],
        )
      ),
    );
  }
}