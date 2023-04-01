import 'package:eksplorasi_storage/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:eksplorasi_storage/contact.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Home(),
      '/login': (context) => const Login()
    },
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
final Future _prefs = SharedPreferences.getInstance();
  String username = '';

  final String _desc = 'A dialog is a type of modal windows that appears in front of app content to provide critical information, or prompt for a decision to be made.';

  List<Contact> contacts = [
    Contact(name: 'Name 1', phone: '+62123456781'),
    Contact(name: 'Name 2', phone: '+62123456782'),
    Contact(name: 'Name 3', phone: '+62123456783'),
    Contact(name: 'Name 4', phone: '+62123456784'),
    Contact(name: 'Name 5', phone: '+62123456785'),
    Contact(name: 'Name 6', phone: '+62123456786'),
    Contact(name: 'John 7', phone: '+62123456787'),
  ];

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  void createContact (String name, String phone) {
    setState(() {
      contacts.add(Contact(name: name, phone: phone));
    });
  }

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
    isLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        actions: [
          IconButton(
            onPressed: (() {
              logout();
            }), 
            icon: const Icon(Icons.logout)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hallo, $username'),
              const SizedBox(height: 20),
              Column(
                children: [
                  const Icon(Icons.contact_phone),
                  const SizedBox(height: 10,),
                  const Text(
                    'Create New Contacts',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    _desc,
                    style: const TextStyle(
                      height: 1.5
                    ),
                  ),
                  const Divider(),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextFormField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            label: Text('Name'),
                            filled: true,
                            hintText: 'John Doe'
                          ),
                        ),
                        const SizedBox(height: 10,),
                        TextFormField(
                          controller: _phoneController,
                          decoration: const InputDecoration(
                            label: Text('Phone'),
                            filled: true,
                            hintText: '081 . . .',
                          ),
                        ),
                        const SizedBox(height: 10,),
                        ElevatedButton(
                          onPressed: () {
                            createContact(_nameController.text.trim(), _phoneController.text.replaceRange(0, 1, '+62'));
                            _nameController.clear();
                            _phoneController.clear();
                          },
                          child: const Text('Submit'),
                        ),
                        const SizedBox(height: 20,),

                        // Contacts
                        const Center(
                          child: Text(
                            'List Contacts',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                            ),
                          ),
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: contacts.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                // ignore: sort_child_properties_last
                                child: Text(
                                  contacts[index].name[0],
                                  style: const TextStyle(
                                    color: Color(0xff6650a5)
                                  ),
                                ),
                                backgroundColor: const Color(0xffe6e0ed),
                              ),
                              title: Text(contacts[index].name),
                              subtitle: Text(contacts[index].phone),
                              trailing: Container(
                                width: 100,
                                height: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        
                                      },
                                      icon: const Icon(Icons.edit),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        
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
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
