import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'interceptors/logging.dart';

// Client
final Client client = InterceptedClient.build(
  interceptors: [LoggingInterceptor()],
);