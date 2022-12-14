import 'package:bytebank/components/centered_message.dart';
import 'package:bytebank/components/loading.dart';
import 'package:bytebank/web/webclients/transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../models/transaction.dart';

class TransactionsList extends StatelessWidget {

  final TransactionWebClient _webClient = TransactionWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body:
        FutureBuilder<List<Transaction>>(
          future: _webClient.findAll(),
          builder: (context, AsyncSnapshot<List<Transaction>> snapshot){

            switch(snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Progress();
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                if (snapshot.hasData) {
                  final List<Transaction> transactions = snapshot.data ?? [];
                  if (transactions.isNotEmpty) {
                    return ListView.builder(
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        final Transaction transaction = transactions[index];
                        return Card(
                          child: ListTile(
                            leading: const Icon(Icons.monetization_on),
                            title: Text(
                              transaction.value.toString(),
                              style: const TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              transaction.contact.accountNumber.toString(),
                              style: const TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                }
                return CenteredMessage(
                  message: "No transactions found!",
                  icon: Icons.warning,
                );
            }

            return CenteredMessage(message: "Unknown error");
          },
        )
    );
  }
}