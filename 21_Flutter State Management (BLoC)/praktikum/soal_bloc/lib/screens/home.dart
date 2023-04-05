import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soal_bloc/bloc/contact_bloc.dart';
import 'package:soal_bloc/screens/create_contact.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: BlocBuilder<ContactBloc, ContactState>(
            builder: (context, state) {
              return Column(
                children: [
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
                                  // Navigator.pushNamed(
                                  //   context,
                                  //   '/create_contact',
                                  //   arguments: CreateContactArguments(
                                  //     contactName: contactProvider.contacts[index].name,
                                  //     contactPhone: contactProvider.contacts[index].phone.replaceRange(0, 3, '0') // replace +62 with zero
                                  //   )
                                  // );
                                  // contactProvider.remove(contactProvider.contacts[index]);
                                },
                                icon: const Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () {
                                  // contactProvider.remove(contactProvider.contacts[index]);
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
          Navigator.pushNamed(
            context,
            '/create_contact',
            arguments: CreateContactArguments(contactName: '', contactPhone: '')
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
