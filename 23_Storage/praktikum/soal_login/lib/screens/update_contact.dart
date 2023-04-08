import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soal_login/bloc/contact_bloc.dart';
import 'package:soal_login/models/contact_model.dart';

class UpdateContact extends StatefulWidget {

  final int index;

  const UpdateContact({super.key, required this.index});

  @override
  State<UpdateContact> createState() => _UpdateContactState();
}

class _UpdateContactState extends State<UpdateContact> {

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  void getContact(BuildContext context) {
    final Contact contact = context.read<ContactBloc>().state.contacts[widget.index];
    setState(() {
      _nameController.text = contact.name!;
      _phoneController.text = contact.phone!.replaceRange(0, 3, '0');
    });
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    getContact(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Icon(Icons.edit_rounded, color: Colors.grey[600]),
            const SizedBox(height: 10,),
            const Text(
              'Update Contact',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),
            ),
            const SizedBox(height: 10,),
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
                        context.read<ContactBloc>().add(UpdateContactByIndex(
                          index: widget.index, 
                          name: _nameController.text.trim(), 
                          phone: _phoneController.text.replaceRange(0, 1, '+62')
                        ));
                        Navigator.pop(context);
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