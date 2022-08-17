// Código autoral
import 'package:bytebank/database/dao/contact_dao.dart';

// Flutter e Plugins
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  // async diz que tudo será executado dentro de um future!
  // Declarar com await quer dizer que o valor só virá após o fim do Future.

  // Função faz a comunicação com o banco interno

  // join junta a string do path com o nome do banco de dados.
  final String path = join(await getDatabasesPath(), 'bytebank.db');

  // openDatabase inicia a comunicação com o banco de dados.
  return openDatabase(
    path,
    onCreate: (db, version) {
      // executa um comando no banco de dados
      db.execute(ContactDao.tableSql);
    },
    version: 1,
  );
}
