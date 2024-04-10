abstract class BaseLocalException implements Exception {
  Exception get exception;
  String? get message;
}

class LocalDatasourceException extends BaseLocalException {
  @override
  final Exception exception;

  @override
  String? message;

  LocalDatasourceException({
    required this.exception,
  }) {
    message = exception.toString();
  }
}
