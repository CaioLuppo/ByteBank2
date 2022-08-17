// Classe que define o modelo de contato
class Contact {
  final String name;
  final int accountNumber;
  final int id;

  Contact(
    this.id,
    this.name,
    this.accountNumber,
  );

  // Cria um contato a partir de um Map (json)
  Contact.fromJson(Map<String, dynamic> json)
      : id = 0,
        name = json['name'],
        accountNumber = json['accountNumber'];

  // Converte o contato para um Map (json)
  Map<String, dynamic> toJson() => {
        'name': name,
        'accountNumber': accountNumber,
      };
}
