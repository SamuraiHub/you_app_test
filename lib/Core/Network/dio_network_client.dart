import 'dart:io';

import 'package:dio/dio.dart';
import 'exceptions.dart';
import 'http_response.dart';
import 'i_network_client.dart';

class DioNetworkClient implements INetworkClient {
  late Dio _dio;

  DioNetworkClient({required BaseOptions options}) {
    _dio = Dio(options);
  }

  @override
  Future<HttpResponse<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) {
    return _dio
        .get<T>(path,
            queryParameters: queryParameters,
            options: Options(headers: headers))
        .then((Response<T> res) {
      _throwIfNoSuccess(res);
      var response = HttpResponse<T>(
          data: res.data!,
          headers: res.headers.map,
          statusCode: res.statusCode ?? 0,
          statusMessage: res.statusMessage ?? '');
      return response;
    });
  }

  void _throwIfNoSuccess(Response res) {
    if (res.data == null) {
      throw HttpException.serverException(res, res.statusMessage ?? '');
    }
    if (res.statusCode != null &&
        (res.statusCode! < 200 || res.statusCode! > 299)) {
      var response = HttpResponse<dynamic>(
          data: res.data,
          headers: res.headers.map,
          statusCode: res.statusCode,
          statusMessage: res.statusMessage);
      throw HttpException.serverException(response, res.statusMessage ?? '');
    }
  }

  @override
  Future<HttpResponse<T>> post<T>(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      body}) {
    return _dio
        .post<T>(path,
            queryParameters: queryParameters,
            options: Options(
              headers: headers,
            ),
            data: body)
        .then((Response<T> res) {
      _throwIfNoSuccess(res);
      var response = HttpResponse<T>(
          data: res.data,
          headers: res.headers.map,
          statusCode: res.statusCode ?? 0,
          statusMessage: res.statusMessage ?? '');
      return response;
    });
  }

  Future<HttpResponse<T>> put<T>(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      body}) {
    return _dio
        .put<T>(path,
            queryParameters: queryParameters,
            options: Options(
              headers: headers,
            ),
            data: body)
        .then((Response<T> res) {
      _throwIfNoSuccess(res);
      var response = HttpResponse<T>(
          data: res.data,
          headers: res.headers.map,
          statusCode: res.statusCode ?? 0,
          statusMessage: res.statusMessage ?? '');
      return response;
    });
  }
}
