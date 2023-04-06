import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:file_picker_provider/view_models/image_provider.dart' as image_provider;

class ImageDetailView extends StatelessWidget {
  
  final int index; 

  const ImageDetailView({super.key, required this.index});
  

  @override
  Widget build(BuildContext context) {

    final item = Provider.of<image_provider.ImageProvider>(context, listen: false).images;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Details'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.file(item[index].file, width: double.infinity),
            const SizedBox(height: 20),
      
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.black,
                ),
                children: [
                  const TextSpan(
                    text: 'File Name: ', 
                    style: TextStyle(fontWeight: FontWeight.bold)
                  ),
                  TextSpan(text: item[index].name)
                ]
              ),
            ),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.black
                ),
                children: [
                  const TextSpan(
                    text: 'File Path: ', 
                    style: TextStyle(fontWeight: FontWeight.bold)
                  ),
                  TextSpan(text: item[index].path)
                ]
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<image_provider.ImageProvider>(context, listen: false).removeImage(index);
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.redAccent)
                ),
                child: const Text('Remove Image'),
              ),
            )
          ],
        ),
      ),
    );
  }
}