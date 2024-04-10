import 'http_response.dart';

abstract class IHttpClient {
  Future<HttpResponse> get(
    final String path, {
    final Map<String, String>? headers,
  });

  Future<HttpResponse> post(
    final String path, {
    final dynamic data,
    final Map<String, String>? headers,
  });

  Future<HttpResponse> put(
    final String path, {
    final data,
    final Map<String, String>? headers,
  });

  Future<HttpResponse> delete(
    final String path, {
    final data,
    final Map<String, String>? headers,
  });

  Future<HttpResponse> patch(
    final String path, {
    final dynamic data,
    final Map<String, String>? headers,
  });

  // Future<HttpResponse> request({
  //   final method,
  //   final path,
  //   final dynamic data,
  //   final Map<String, dynamic>? headers,
  //   final Map<String, dynamic>? queryParameters,
  // });
}
