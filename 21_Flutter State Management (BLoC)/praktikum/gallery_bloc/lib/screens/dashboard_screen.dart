import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_bloc/bloc/image_bloc.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text('Your Gallery', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              BlocBuilder<ImageBloc, ImageState>(
                builder: (context, state) {
                  return state.images.isEmpty
                  ? const Center(heightFactor: 2, child: Text('Currently no image available, try adding one'))
                  : GridView.builder(
                    itemCount: state.images.length,
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
                            '/detail_image_screen',
                            arguments: index
                          );
                          
                        },
                        child: Image.file(state.images[index].file)
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ImageBloc>().add(AddImageButton());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}