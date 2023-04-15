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

  void getImage(String seed) async {
    setState(() {
      isLoading = true;
    });

    final dio = Dio();
    int randomIndex = Random().nextInt(imageStyles.length);
    print(seed);

    try {
      final response = await dio.get('https://api.dicebear.com/6.x/${imageStyles[randomIndex]}/svg?seed=$seed');
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

  final keywordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image API - DiceBear'),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: isLoading
          ? const CircularProgressIndicator()
          : Column(
            children: [
              const SizedBox(height: 20),
              imageSvg != null ? imageSvg! : const Text('Generate some image'),
              TextFormField(
                controller: keywordController,
                decoration: const InputDecoration(
                  hintText: 'Seed',
                  labelText: 'Seed'
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  getImage(keywordController.text);
                },
                child: const Text('Generate Image'),
              )
            ],
          )
        ),
      ),
    );
  }
}