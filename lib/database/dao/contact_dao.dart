// Código autoral
import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contact.dart';

// Flutter e Plugins
import 'package:sqflite/sqflite.dart';

// Data Access Object
class ContactDao {
  static const String tableSql =
      'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_accountNumber INTEGER)';

  static const String _tableName = "contacts";
  static const String _id = "id";
  static const String _name = "name";
  static const String _accountNumber = "account_number";

  // Salva o contato
  Future<int> save(Contact contact) async {
    final Database db = await getDatabase();
    Map<String, dynamic> contactMap = _toMap(contact);

    return db.insert(_tableName, contactMap);
  }

  // Lista todos os contatos
  Future<List<Contact>> findAll() async {
    // Async await
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);

    List<Contact> contacts = _toList(result);

    return contacts;
  }

  // Converte contato para mapa
  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = {};

    // sem o ID, fará o incremento automático
    contactMap[_name] = contact.name;
    contactMap[_accountNumber] = contact.accountNumber;
    return contactMap;
  }

  // Converta contato em lista
  List<Contact> _toList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = [];

    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        row['id'],
        row['name'],
        row['account_number'],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}
