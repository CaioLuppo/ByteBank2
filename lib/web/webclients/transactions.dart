// Código autoral
import 'package:bytebank/models/transaction.dart';
import 'package:bytebank/web/webclient.dart';

// Flutter e Plugins
import 'package:http/http.dart';
import 'dart:convert';

// Código para comunicação relacionada às transações ---------------------------
class TransactionWebClient {
  // URL da Web API (Altere aqui caso esteja testando o código)
  final Uri baseUrl = Uri.parse('http://192.168.15.12:8080/transactions');

  Future<List<Transaction>> findAll() async {
    // Função que retorna uma lista com todas as transações na Web API

    // Endereço padrão da web API
    final Response response =
        await client.get(baseUrl).timeout(const Duration(seconds: 5));

    // decodifica a string e retorna um dynamic:
    final List<dynamic> decodedJson = jsonDecode(response.body);

    // Função map cria uma lista de mapas baseada em uma iteração com o
    // dynamic utilizado, isso simplifica a conversão:
    return decodedJson
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }

  Future<Transaction> save(Transaction transaction) async {
    // Função salva a transação na Web API

    // Transação (em mapa) convertida em uma String json:
    final String transactionJson = jsonEncode(transaction.toJson());

    // Guarda a resposta da requisição post após inserir uma transação:
    final Response response = await client.post(
      baseUrl, // URL utilizada
      headers: {
        'Content-Type': 'application/json',
        'password': '1000',
      }, // cabeçalho com o tipo do conteúdo e a senha usada
      body: transactionJson, // o que será enviado de fato (corpo)
    );

    return Transaction.fromJson(jsonDecode(response.body));
  }
}
