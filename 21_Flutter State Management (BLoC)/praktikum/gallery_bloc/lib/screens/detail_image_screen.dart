import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_bloc/bloc/image_bloc.dart';
import 'package:gallery_bloc/models/image_model.dart';

class DetailImageScreen extends StatelessWidget {

  final int index;

  const DetailImageScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {

    final List<ImageModel> images = context.read<ImageBloc>().state.images;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Details'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.file(images[index].file, width: double.infinity),
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
                  TextSpan(text: images[index].name)
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
                  TextSpan(text: images[index].path)
                ]
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<ImageBloc>().add(RemoveImageButton(index: index));
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