import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soal_form/Contact.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData().copyWith(
      colorScheme: ThemeData().colorScheme.copyWith(secondary: Colors.black),
      appBarTheme: const AppBarTheme(
        color: Color(0xff6650a5),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xff6650a5))
        )
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Color(0xffe6e0ed),
        labelStyle: TextStyle(
          color: Colors.grey
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey
          )
        ),
      )
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

  void createContact(String name, String phone) {
    setState(() {
      contacts.add(Contact(name: name, phone: phone));
    });
  }

  void removeContact(String phone) {
    setState(() {
      contacts.removeWhere((element) => element.phone == phone);
    });
  }

  void editContact(String name, String phone) {
    setState(() {
      _nameController.text = name;
      _phoneController.text = phone;
    });
    removeContact(phone.replaceRange(0, 1, '+62'));
  }

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
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
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                        label: Text('Name'),
                        filled: true,
                        fillColor: Color(0xffe6e0ed),
                        labelStyle: TextStyle(
                          color: Colors.grey
                        ),
                        hintText: 'John Doe',
                        errorMaxLines: 2
                      ),
                      validator: (value) {
                        if (value == '') {
                          return 'Name should not be empty';
                        }
                        if (value!.split(' ').length < 2) {
                          return 'Name should be 2 words minimum';
                        }
                        if (RegExp(r'\d|\W').hasMatch(value.split(' ').join(''))) {
                          return 'Name should not be contain any number or any spesial character';
                        }
                      },
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      maxLength: 15,
                      decoration: const InputDecoration(
                        label: Text('Phone'),
                        hintText: '081 . . .',
                      ),
                      validator: (value) {
                        if (value == '') {
                          return 'Phone should not be empty';
                        }
                        if (value![0] != '0') {
                          return 'Phone should be started with zero';
                        }
                        if (value.length < 8) {
                          return 'Phone should be around 8-15 numbers';
                        }
                      },
                    ),
                    const SizedBox(height: 10,),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          createContact(_nameController.text.trim(), _phoneController.text.replaceRange(0, 1, '+62'));
                          _nameController.clear();
                          _phoneController.clear();
                        }
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
                          trailing: SizedBox(
                            width: 100,
                            height: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    editContact(contacts[index].name.trim(), contacts[index].phone.replaceRange(0, 3, '0'));
                                    _scrollController.animateTo(
                                      0,
                                      duration: const Duration(milliseconds: 500),
                                      curve: Curves.easeOut
                                    );
                                  },
                                  icon: const Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: () {
                                    removeContact(contacts[index].phone);
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
        ),
      ),
    );
  }
}