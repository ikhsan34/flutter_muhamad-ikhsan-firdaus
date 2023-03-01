import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: const Color(0xFF6200EE),
      secondary: const Color(0xFF03DAC5),
    ),
  ),
    home: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _selectedIndex = 0;

  List bodyContent = [
    'Favorites Page',
    'Search Page',
    'Information Page'
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Flutter App'),
        //backgroundColor: const Color(0xFF6200EE),
      ),
      body: Center(
        child: Text(bodyContent.elementAt(_selectedIndex)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF6200EE),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.info,
            ),
            label: 'Information'
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        child: const Icon(
          Icons.add
        ),
      ),
    );
  }
}