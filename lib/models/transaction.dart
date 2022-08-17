// Código autoral
import 'contact.dart';

// Classe que guarda o modelo de uma transação
class Transaction {
  final double value;
  final Contact contact;

  Transaction(
    this.value,
    this.contact,
  );

  // Armazena os valores à partir de um Mapa (json)
  Transaction.fromJson(Map<String, dynamic> json)
      : value = json['value'],
        contact = Contact.fromJson(json['contact']);

  // Converte a transação em um Mapa (json)
  Map<String, dynamic> toJson() => {
        'value': value,
        'contact': contact.toJson(),
      };
}
