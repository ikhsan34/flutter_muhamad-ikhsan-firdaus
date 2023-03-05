import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    home: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App'),
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Text('L'),
            ),
            title: Text('Leanne Graham'),
            subtitle: Text('1-770-736-8031'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Text('E'),
            ),
            title: Text('Ervin Howell'),
            subtitle: Text('010-692-6593'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Text('C'),
            ),
            title: Text('Clementine Bauch'),
            subtitle: Text('1-463-123-4447'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Text('P'),
            ),
            title: Text('Patricia Lebsack'),
            subtitle: Text('493-170-9623'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Text('C'),
            ),
            title: Text('Chelsey Dietrich'),
            subtitle: Text('254-954-1289'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Text('M'),
            ),
            title: Text('Mrs. Dennis Schulist'),
            subtitle: Text('1-477-935-8478'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Text('K'),
            ),
            title: Text('Kurtis Weissnat'),
            subtitle: Text('210-067-6132'),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: const [
            SizedBox(height: 20,), // give padding to the top
            ListTile(
              title: Text('Home'),
            ),
            ListTile(
              title: Text('Settings'),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: 'Settings'
          ),
        ],
      ),
    );
  }
}


