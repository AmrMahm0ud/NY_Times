// import 'package:connectivity/connectivity.dart';
import 'dart:developer' as developer;

import 'package:dio/dio.dart';

class ConnectivityInterceptorsCastException implements Exception {
  final message =
      'No internet connection, please check internet connection and try again';

  @override
  String toString() => message;
}

class CustomInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    log('${options.method}${' '}] ${' '} URL: ${options.baseUrl + options.path}',
        options.data.toString());
    handler.next(options);
    // } else
    //   throw ConnectivityInterceptorsCastException();
  }
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log('api.error', err.message, error: err, stackTrace: err.stackTrace);
    handler.next(err);
  }
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('api.response: ${response.statusCode.toString()}', response.data.toString());
    handler.next(response);
  }
  void log(String name, String message,
      {dynamic error, StackTrace? stackTrace}) {
    developer.log(message, name: name, stackTrace: stackTrace, error: error);
  }
}