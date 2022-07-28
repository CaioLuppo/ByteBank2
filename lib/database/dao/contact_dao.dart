import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class ContactDao {
  Future<int> save(Contact contact) async {

    final Database db = await getDatabase();
    final Map<String, dynamic> contactMap = {};

    // sem o ID, fará o incremento automático
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.accountNumber;

    return db.insert('contacts', contactMap);


    // ANTES DO ASYNC:
    // return getDatabase().then((db) {
    //   final Map<String, dynamic> contactMap = {};
    //
    //   // sem o ID, fará o incremento automático
    //   contactMap['name'] = contact.name;
    //   contactMap['account_number'] = contact.accountNumber;
    //
    //   return db.insert('contacts', contactMap);
    // });
  }

  Future<List<Contact>> findAll() async {

    // Async await
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query('contacts');

    // Lista de contatos encontrados
    final List<Contact> contacts = [];

    // Pra cara mapa dentro da lista trazida, guarda o contato em contacts
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        row['id'], // campos do banco de dados
        row['name'],
        row['account_number'],
      );
      contacts.add(contact); // adiciona o contato na lista
    }
    return contacts; // retorna a lista de contatos


    // ANTES DO ASYNC
    // return getDatabase().then((db) {
    //   return db.query('contacts').then((maps) {
    //     final List<Contact> contacts = [];
    //     for (Map<String, dynamic> map in maps) {
    //       final Contact contact = Contact(
    //         map['id'],
    //         map['name'],
    //         map['account_number'],
    //       );
    //       contacts.add(contact);
    //     }
    //     return contacts;
    //   });
    // });
  }
}