import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late Image image;

  void getImage() async {
    final dio = Dio();

    final response = await dio.get('https://api.dicebear.com/6.x/pixel-art/svg?seed=John');

    print(response);

  }

  @override
  void initState() {
    super.initState();
    getImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image API - DiceBear'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 2
        ),
        children: const [
          
        ],
      ),
    );
  }
}