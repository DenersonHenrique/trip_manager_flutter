import '../../adapters/http/http_error.dart';
import '../../adapters/http/http_request.dart';

abstract class BaseException implements Exception {
  Exception get exception;
  String? get message;
}

class DatasourceException extends BaseException {
  dynamic data;
  int? statusCode;
  HttpRequest? httpRequest;

  @override
  final Exception exception;

  @override
  String? message;

  parseError(HttpError exception) {
    data = exception.data;
    statusCode = exception.statusCode;
    httpRequest = httpRequest;
    message =
        data is Map ? exception.data['message'] : exception.data.toString();
  }

  DatasourceException({
    required this.exception,
  }) {
    if (exception is HttpError) {
      parseError(exception as HttpError);
    } else {
      message = exception.toString();
    }
  }
}
