// Código autoral
import 'interceptors/logging.dart';

// Flutter e Plugins
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

// Client usado para a comunicação, utilizando um interceptador para debug
final Client client = InterceptedClient.build(
  interceptors: [LoggingInterceptor()],
);
