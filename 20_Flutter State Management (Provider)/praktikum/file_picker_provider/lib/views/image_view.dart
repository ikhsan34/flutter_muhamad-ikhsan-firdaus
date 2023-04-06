import 'package:file_picker_provider/models/transition_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:file_picker_provider/view_models/image_provider.dart' as image_provider;

class ImageView extends StatelessWidget {
  const ImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Gallery'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Consumer<image_provider.ImageProvider>(
                builder: (context, image, child) {
                  return image.images.isEmpty
                  ? const Center(heightFactor: 5, child: Text('Currently no image available, try adding one'))
                  : GridView.builder(
                    itemCount: image.images.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/image_detail',
                            arguments: index
                          );
                          
                        },
                        child: Image.file(image.images[index].file)
                      );
                    },
                  );
                },
              )
            ],

          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<image_provider.ImageProvider>(context, listen: false).addImage();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}