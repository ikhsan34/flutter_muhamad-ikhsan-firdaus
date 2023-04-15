import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('About Us', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        const Text('This company is offering mobile app development as requested'),
        const SizedBox(height: 5),
        Column(
          children: const [
            Card(
              child: ListTile(
                title: Text('Flutter App'),
                subtitle: Text('Create mobile android & IOS using Flutter framework'),
                isThreeLine: true,
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Backend API'),
                subtitle: Text('Create rest API using NodeJS'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Frontend Web'),
                subtitle: Text('Create interactive website using REACTJS'),
              ),
            ),
          ],
        )
      ],
    );
  }
}