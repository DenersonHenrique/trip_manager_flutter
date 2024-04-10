import 'http_request.dart';

class HttpError implements Exception {
  final dynamic data;
  final int statusCode;
  final HttpRequest httpRequest;
  final dynamic requestData;

  HttpError({
    this.data,
    required this.statusCode,
    required this.httpRequest,
    this.requestData,
  });

  @override
  String toString() {
    return 'HttpError{data: $data, statusCode: $statusCode, httpRequest: $httpRequest, requestData: $requestData}';
  }
}
