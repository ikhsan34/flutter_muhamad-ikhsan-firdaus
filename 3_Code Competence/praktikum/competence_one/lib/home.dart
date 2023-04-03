import 'package:competence_one/contact_us.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Icon(
                Icons.image,
                size: 200,
                color: Colors.grey,
              ),
              const Text(
                'Image Picker',
                style: TextStyle(
                  fontSize: 20
                ),
              ),
              const SizedBox(height: 10),
              const Text('You can search images online and save to device.'),

              const SizedBox(height: 30),
              const Text('Example Images', style: TextStyle(fontWeight: FontWeight.bold),),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: const [
                  Image(
                    image: AssetImage('assets/images/Nissan S15.jpg'),
                  ),
                  Image(
                    image: AssetImage('assets/images/Nissan S14.jpg'),
                  ),
                  Image(
                    image: AssetImage('assets/images/Nissan R34.jpg'),
                  ),
                  Image(
                    image: AssetImage('assets/images/Nissan S13.jpg'),
                  ),
                ],
              ),
              const ContactUs(),

              const SizedBox(height: 200),
            ],
          ),
        ),
      ),
    );
  }
}