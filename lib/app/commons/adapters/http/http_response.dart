import 'http_request.dart';

class HttpResponse {
  final dynamic data;
  final int statusCode;
  final HttpRequest? httpRequest;

  HttpResponse({
    this.data,
    required this.statusCode,
    this.httpRequest,
  });
}
