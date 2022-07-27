import 'package:flutter/material.dart';

import 'package:bytebank/screens/contact_form.dart';
import '../models/contact.dart';

class ContactsList extends StatelessWidget {

  final List<Contact> contacts = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
      ),
      body: ListView.builder(
        itemBuilder: (context, indx) {
          final Contact contact = contacts[indx];
          return _ContactItem(contact);
        },
        itemCount: contacts.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const NewContact()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {

  final Contact contact;

  _ContactItem( this.contact );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.name,
          style: const TextStyle(fontSize: 24),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
