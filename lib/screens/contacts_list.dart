import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/screens/contact_form.dart';
import 'package:bytebank/screens/transaction_form.dart';
import 'package:flutter/material.dart';

import '../components/loading.dart';
import '../models/contact.dart';

class ContactsList extends StatefulWidget {

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {

  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transfer"),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: const [],
        future: _dao.findAll(), // Executa a busca no banco de dados
        builder: (context, snapshot){ // snapshot é o retorno do future escolhido

          switch(snapshot.connectionState){ // todos os estados do future
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress();
            case ConnectionState.active:
              break;
            case ConnectionState.done: // snapshot.data é uma lista Contact
              final List<Contact> contacts = snapshot.data!;
              if (contacts.isNotEmpty) { // se tiver algum contato
                return ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, indx) {
                    final Contact contact = contacts[indx];
                    return _ContactItem(contact, onClick: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => TransactionForm(contact),),);
                    },);
                  },
                );
              } else { // caso não tenha encontrado contato
                return const Center(child: Text("No contacts found."));
              }
          } return const Center(child: Text("Unknown error.")); // FutureB !null
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const NewContact()),
          ).then((value) => setState((){})); // Atualiza a lista
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {

  final Contact contact;
  final Function onClick;

  const _ContactItem( this.contact, {required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onClick(),
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
