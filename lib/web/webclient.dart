
import 'package:http/http.dart';
import 'package:path/path.dart';

void findAll() async {
  // Endereço padrão da web API
  final Response response = await get(toUri('http://192.168.15.12:8080/transactions'));
  print(response);
}