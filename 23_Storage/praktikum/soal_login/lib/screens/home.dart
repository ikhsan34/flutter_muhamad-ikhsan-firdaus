import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soal_login/bloc/contact_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String username = '';

  void isLoggedIn() async {
    final SharedPreferences prefs = await _prefs;
    if(prefs.getString('username') == null) {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      setState(() {
        username = prefs.getString('username') ?? '';
      });
    }
  }

  void logout() async {
    final SharedPreferences prefs = await _prefs;
    prefs.clear();
    isLoggedIn();
  }

  @override
  void initState() {
    super.initState();
    isLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                logout();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white)
              ),
              child: const Text('Logout'),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: BlocBuilder<ContactBloc, ContactState>(
            builder: (context, state) {
              return Column(
                children: [
                  username.isEmpty
                  ? Container()
                  : Row(
                    children: [
                      const Text('Welcome, '),
                      Text(username)
                    ],
                  ),
                  const Center(
                    child: Text(
                      'List Contacts',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  state.contacts.isEmpty
                  ? const Text('No contact available, please create one')
                  : ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.contacts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Color(0xffe6e0ed),
                          child: Text(
                            'A',
                            style: TextStyle(color: Color(0xff6650a5)),
                          ),
                        ),
                        title: Text(state.contacts[index].name!),
                        subtitle: Text(state.contacts[index].phone!),
                        trailing: SizedBox(
                          width: 100,
                          height: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/update_contact',
                                    arguments: index
                                  );
                                },
                                icon: const Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () {
                                  context.read<ContactBloc>().add(DeleteContactByIndex(index));
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create_contact');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
