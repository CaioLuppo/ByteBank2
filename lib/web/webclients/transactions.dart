import 'dart:convert';

import 'package:bytebank/models/transaction.dart';
import 'package:bytebank/web/webclient.dart';

import 'package:http/http.dart';


class TransactionWebClient {

  final Uri baseUrl = Uri.parse('http://192.168.15.12:8080/transactions');

  Future<List<Transaction>> findAll() async {

    // Endereço padrão da web API
    final Response response =
    await client.get(baseUrl).timeout(const Duration(seconds: 5));

    // decodifica a string e retorna um dynamic:
    final List<dynamic> decodedJson = jsonDecode(response.body);

    // Função map cria uma lista de mapas baseada em uma iteração com o
    // dynamic utilizado, isso simplifica a conversão:
    return decodedJson.map((dynamic json) => Transaction.fromJson(json)).toList();;
  }

  Future<Transaction> save(Transaction transaction) async {

    final String transactionJson = jsonEncode(transaction.toJson());

    final Response response = await client.post(
      baseUrl,
      headers: {
        'Content-Type':'application/json',
        'password':'1000',
      },
      body: transactionJson,
    );

    return Transaction.fromJson(jsonDecode(response.body));
  }

}