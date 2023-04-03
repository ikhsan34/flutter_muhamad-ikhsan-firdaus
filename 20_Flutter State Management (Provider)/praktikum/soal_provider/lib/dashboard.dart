import 'package:flutter/material.dart';
import 'package:soal_provider/arguments/create_contact_arguments.dart';
import 'package:soal_provider/contact.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {

    final contactProvider = Provider.of<Contacts>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              const Center(
                child: Text(
                  'List Contacts',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                  ),
                ),
              ),

              contactProvider.contacts.isEmpty
              ? const Text('No contact available, please create one')
              : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: contactProvider.contacts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Color(0xffe6e0ed),
                      child: Text(
                        'A',
                        style: TextStyle(
                          color: Color(0xff6650a5)
                        ),
                      ),
                    ),
                    title: Text(contactProvider.contacts[index].name),
                    subtitle: Text(contactProvider.contacts[index].phone),
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
                                '/create_contact',
                                arguments: CreateContactArguments(
                                  contactName: contactProvider.contacts[index].name,
                                  contactPhone: contactProvider.contacts[index].phone.replaceRange(0, 3, '0') // replace +62 with zero
                                )
                              );
                              contactProvider.remove(contactProvider.contacts[index]);
                            },
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              contactProvider.remove(contactProvider.contacts[index]);
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