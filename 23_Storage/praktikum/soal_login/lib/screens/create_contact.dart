import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soal_login/bloc/contact_bloc.dart';

class CreateContact extends StatefulWidget {

  const CreateContact({super.key});

  @override
  State<CreateContact> createState() => _CreateContactState();
}

class _CreateContactState extends State<CreateContact> {
  final String _desc = 'A dialog is a type of modal windows that appears in front of app content to provide critical information, or prompt for a decision to be made.';

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  void createContact({required BuildContext context, required String name, required String phone}) {
    context.read<ContactBloc>().add(CreateContactSubmitted(name, phone));
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Contact'),
      ),
      body: Padding(
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
              textAlign: TextAlign.center,
              style: const TextStyle(
                height: 1.5
              ),
            ),
            const Divider(),

            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                      label: Text('Name'),
                      filled: true,
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
                      return null;
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
                      filled: true,
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
                      return null;
                    },
                  ),
                  const SizedBox(height: 10,),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        createContact(context: context, name: _nameController.text.trim(), phone: _phoneController.text.replaceRange(0, 1, '+62'));
                        _nameController.clear();
                        _phoneController.clear();
                      }
                    },
                    child: const Text('Submit'),
                  ),
                  const SizedBox(height: 20,),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}