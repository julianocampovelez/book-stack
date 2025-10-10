import 'package:dio/dio.dart';

import 'package:app/core/env/config_env.dart';

class DioNetwork {
  final Dio _dio;

  DioNetwork({String? baseUrl})
    : _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl ?? ConfigEnv.itbookApiUrl,
          contentType: Headers.jsonContentType,
        ),
      );

  Dio get client => _dio;
}
