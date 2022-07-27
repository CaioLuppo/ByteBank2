import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
      ),
      body: ListView(
        children: const [
          Card(
            child: ListTile(
              title: Text(
                "Caio",
                style: TextStyle(fontSize: 24),
              ),
              subtitle: Text(
                "0000",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
