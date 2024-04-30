import 'http_response.dart';

abstract class INetworkClient {

  Future<HttpResponse<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers});

  Future<HttpResponse<T>> post<T>(String path,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, dynamic body});

  Future<HttpResponse<T>> put<T>(String path,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, dynamic body});
}