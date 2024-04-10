import 'package:http/http.dart' as http;

import 'http_client.dart';
import 'http_response.dart';

class HttpClient implements IHttpClient {
  final client = http.Client();

  @override
  Future<HttpResponse> get(
    String path, {
    Map<String, String>? headers,
  }) async {
    final response = await client.get(
      Uri.parse(path),
      headers: headers,
    );

    return HttpResponse(
      statusCode: response.statusCode,
      data: response.body,
    );
  }

  @override
  Future<HttpResponse> post(
    String path, {
    data,
    Map<String, String>? headers,
  }) async {
    final response = await client.post(
      Uri.parse(path),
      body: data,
      headers: headers,
    );

    return HttpResponse(
      statusCode: response.statusCode,
      data: response.body,
    );
  }

  @override
  Future<HttpResponse> delete(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    final response = await client.delete(
      Uri.parse(path),
      headers: headers,
    );

    return HttpResponse(
      statusCode: response.statusCode,
      data: response.body,
    );
  }

  @override
  Future<HttpResponse> patch(
    String path, {
    data,
    Map<String, String>? headers,
  }) async {
    final response = await client.patch(
      Uri.parse(path),
      body: data,
      headers: headers,
    );

    return HttpResponse(
      statusCode: response.statusCode,
      data: response.body,
    );
  }

  @override
  Future<HttpResponse> put(
    String path, {
    data,
    Map<String, String>? headers,
  }) async {
    final response = await client.put(
      Uri.parse(path),
      body: data,
      headers: headers,
    );

    return HttpResponse(
      statusCode: response.statusCode,
      data: response.body,
    );
  }
}
