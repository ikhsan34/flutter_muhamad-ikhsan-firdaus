import 'package:competence_two/shared/about_us.dart';
import 'package:competence_two/shared/contact_us.dart';
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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

              const SizedBox(height: 20),
              const Text('Example Images', style: TextStyle(fontWeight: FontWeight.bold),),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                primary: false,
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
              const AboutUs(),
              const SizedBox(height: 20),
              const ContactUs(),
              const SizedBox(height: 200),
            ],
          ),
        ),
      ),
      endDrawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  
                },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size.fromHeight(35))
                ),
                child: const Text('About Us'),
              ),
              ElevatedButton(
                onPressed: () {
                  
                },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size.fromHeight(35))
                ),
                child: const Text('Contact Us'),
              ),
              ElevatedButton(
                onPressed: () {
                  
                },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size.fromHeight(35))
                ),
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}