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

  final _listView = ListView(
    children: const [
      Card(
        child: ListTile(
          title: Text('Learn Flutter'),
        ),
      ),
      Card(
        child: ListTile(
          title: Text('Learn ReactJS'),
        ),
      ),
      Card(
        child: ListTile(
          title: Text('Learn VueJS'),
        ),
      ),
      Card(
        child: ListTile(
          title: Text('Learn Tailwind CSS'),
        ),
      ),
      Card(
        child: ListTile(
          title: Text('Learn UI/UX'),
        ),
      ),
      Card(
        child: ListTile(
          title: Text('Learn Figma'),
        ),
      ),
      Card(
        child: ListTile(
          title: Text('Learn Digital Marketing'),
        ),
      ),
    ],
  );

  List<Widget> bodyContent = [
    const Text('Favorites Page'),
    const Text('Search Page'),
    const Text('Information Page'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    bodyContent[0] = _listView;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Flutter App'),
        //backgroundColor: const Color(0xFF6200EE),
        actions: [
          TextButton(
            onPressed: () {
              //print('test');
            },
            child: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
          )
        ],
      ),
      body: Center(
        child: bodyContent.elementAt(_selectedIndex),
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
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}