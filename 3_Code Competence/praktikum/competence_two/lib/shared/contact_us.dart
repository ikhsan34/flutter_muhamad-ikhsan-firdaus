import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {

  final _formKey = GlobalKey<FormState>();

  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Contact Us', style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
          const Text(' '),
          RichText(
            text: TextSpan(
              text: 'Need to get in touch with us? Either fill out the form with your inquiry or find the ',
              style: DefaultTextStyle.of(context).style,
              children: const [
                TextSpan(text: 'department email ', style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline
                )),
                TextSpan(text: 'you\'d like to contact below.')
              ]
            ),
          ),
          
          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: firstnameController,
                  decoration: const InputDecoration(
                    labelText: 'Firstname',
                    filled: true
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please fill form';
                    }
                  },
                )
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextFormField(
                  controller: lastnameController,
                  decoration: const InputDecoration(
                    labelText: 'Lastname',
                    filled: true
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please fill form';
                    }
                  },
                )
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              filled: true
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please fill form';
              }
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: descController,
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: 'What can we help you with?',
              filled: true
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please fill form';
              }
            },
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context, 
                      builder:(context) {
                        return AlertDialog(
                          title: const Text('Your detail'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Wrap(
                                children: [
                                  const Text('Your name: '),
                                  Text('${firstnameController.text} ${lastnameController.text}'),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Wrap(
                                children: [
                                  const Text('Your Email: '), 
                                  Text(emailController.text, overflow: TextOverflow.visible,),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              const Text('Problems: '),
                              Text(descController.text)
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            )
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ],
      ),
      );
  }
}