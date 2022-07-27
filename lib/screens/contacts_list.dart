import 'package:bytebank/database/app_database.dart';
import 'package:flutter/material.dart';

import 'package:bytebank/screens/contact_form.dart';
import '../models/contact.dart';

class ContactsList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
      ),
      body: FutureBuilder<List<Contact>>(
        future: findAll(),
        builder: (context, snapshot){

          switch(snapshot.connectionState){
            case ConnectionState.none:
              break;

            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    Text("Loading")
                  ],
                ),
              );

            case ConnectionState.active:
              break;

            case ConnectionState.done:
              final List<Contact> contacts = snapshot.data!;

              if (contacts.isNotEmpty) { // se tiver algum contato
                return ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, indx) {
                    final Contact contact = contacts[indx];
                    return _ContactItem(contact);
                  },
                );
              } else { // caso não tenha encontrado contato
                return const Center(child: Text("No contacts found."));
              }
          }

          return const Center(child: Text("Unknown error."));

          
        },
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

  const _ContactItem( this.contact );

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
