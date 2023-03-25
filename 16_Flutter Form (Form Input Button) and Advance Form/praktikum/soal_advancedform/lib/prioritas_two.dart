import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:soal_advancedform/contact.dart';

class PrioritasTwo extends StatefulWidget {
  const PrioritasTwo({super.key});

  @override
  State<PrioritasTwo> createState() => _PrioritasTwoState();
}

class _PrioritasTwoState extends State<PrioritasTwo> {
  final String _desc = 'A dialog is a type of modal windows that appears in front of app content to provide critical information, or prompt for a decision to be made.';

  List<Contact> contacts = [
    //Contact(name: 'Name One', phone: '+62123456781', dob: DateTime(DateTime.now().year - 5)),
    //Contact(name: 'Name Two', phone: '+62123456782', dob: DateTime(DateTime.now().year - 5)),
  ];

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  void createContact({
    required String name, 
    required String phone, 
    required DateTime dob, 
    required Color color, 
    required PlatformFile path
    }) {
    setState(() {
      contacts.add(Contact(name: name, phone: phone, dob: dob, color: color, path: path));
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

  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();

  Color _currentColor = Colors.orange;

  PlatformFile? path;

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    path = file;
    print(path!.path);
    //_openFile(file);
  }

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
                  ],
                ),
              ),
              
              // Picker
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date Picker
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text('Date of Birth'),
                          const SizedBox(width: 5,),
                          Text(DateFormat('dd-MM-yyyy').format(_dueDate)),
                        ],
                      ),
                      TextButton(
                        onPressed: () async {
                          final selectDate = await showDatePicker(
                            context: context,
                            initialDate: currentDate,
                            firstDate: DateTime(1990),
                            lastDate: DateTime(currentDate.year + 5)
                          );
                          setState(() {
                            if (selectDate != null) {
                              _dueDate = selectDate;
                            }
                          });
                        },
                        child: const Text('Select'),
                      ),
                    ],
                  ),
                  
                  // Color Picker
                  const Text('Color'),
                  const SizedBox(height: 10,),
                  Container(
                    height: 100,
                    width: double.infinity,
                    color: _currentColor,
                  ),
                  const SizedBox(height: 10,),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Pick your Color'),
                              content: BlockPicker(
                                pickerColor: _currentColor,
                                onColorChanged: (value) {
                                  setState(() {
                                    _currentColor = value;
                                  });
                                },
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Save'),
                                )
                              ],
                            );
                          },
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(_currentColor)
                      ),
                      child: const Text('Pick a Color'),
                    ),
                  ),

                  // File Picker
                  const Text('Pick File'),
                  const SizedBox(height: 10,),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => _pickFile(),
                      child: const Text('Pick and Open File'),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate() && path != null) {
                          createContact(
                            name: _nameController.text.trim(), 
                            phone: _phoneController.text.replaceRange(0, 1, '+62'), 
                            dob: _dueDate,
                            color: _currentColor,
                            path: path!
                          );
                          _nameController.clear();
                          _phoneController.clear();
                          path = null;
                          print(contacts);
                          contacts.forEach((element) {
                            print(element.name);
                            print(element.phone);
                            print(element.dob);
                            print(element.color);
                            print(element.path);
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text('Please fill out all form'),
                          ));
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                  const SizedBox(height: 20,),
                ],
              ),

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
              contacts.isEmpty ? const Text('Currently no contacts, please create one')
              : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    isThreeLine: true,
                    leading: CircleAvatar(
                      backgroundColor: contacts[index].color,
                      child: Text(
                        contacts[index].name[0],
                        style: const TextStyle(
                          color: Color(0xff6650a5)
                        ),
                      ),
                    ),
                    title: Text(contacts[index].name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(contacts[index].phone),
                        Text(DateFormat('dd-MM-yyyy').format(contacts[index].dob)),
                        Text('File: ${contacts[index].path.path.toString().split('/').last}'),
                      ],
                    ),
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
      ),
    );
  }
}