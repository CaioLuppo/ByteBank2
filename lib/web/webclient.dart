import 'dart:convert';

import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';

import 'package:http_interceptor/http_interceptor.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';

// http_interceptor

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print("---- REQUEST ----");
    print('URL: ${data.url.toString()}');
    print('HEADERS: ${data.headers.toString()}');
    print('BODY: ${data.body.toString()}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print("---- RESPONSE ----");
    print("STATUS CODE: ${data.statusCode}");
    print('HEADERS: ${data.headers.toString()}');
    print('BODY: ${data.body.toString()}');
    return data;
  }
}

// Client
final Client client = InterceptedClient.build(
  interceptors: [LoggingInterceptor()],
);
final Uri baseUrl = Uri.parse('http://192.168.15.12:8080/transactions');

Future<List<Transaction>> findAll() async {

  // Endereço padrão da web API
  final Response response =
      await client.get(baseUrl).timeout(const Duration(seconds: 5));
  final List<dynamic> decodedJson =
      jsonDecode(response.body); // decodifica a string e retorna um dynamic
  final List<Transaction> transactions = [];

  for (Map<String, dynamic> transactionJson in decodedJson) {
    final Map<String, dynamic> contactJson = transactionJson['contact'];
    final Transaction transaction = Transaction(
      transactionJson['value'],
      Contact(
        0,
        contactJson['name'],
        contactJson['accountNumber'],
      ),
    );
    transactions.add(transaction);
  } return transactions;
}

Future<Transaction> save(Transaction transaction) async {

  Map<String, dynamic> transactionMap = {
    'value' : transaction.value,
    'contact' : {
      'name' : transaction.contact.name,
      'accountNumber' : transaction.contact.accountNumber
    }
  };
  final String transactionJson = jsonEncode(transactionMap);

  final Response response = await client.post(
    baseUrl,
    headers: {
      'Content-Type':'application/json',
      'password':'1000',
    },
    body: transactionJson,
  );

  Map<String, dynamic> json = jsonDecode(response.body);

  final Map<String, dynamic> contactJson = json['contact'];
  return Transaction(
    json['value'],
    Contact(
      0,
      contactJson['name'],
      contactJson['accountNumber'],
    ),
  );
}
