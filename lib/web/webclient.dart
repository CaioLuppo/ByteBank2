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

void findAll() async {
  // Client
  final Client client = InterceptedClient.build(
    interceptors: [LoggingInterceptor()],
  );

  // Endereço padrão da web API
  final Response response =
      await client.get(toUri('http://192.168.15.12:8080/transactions'));
}
