import 'package:dio/dio.dart';

import 'package:app/core/env/config_env.dart';

// DioNetwork handles HTTP requests using the Dio package.
class DioNetwork {
  // Internal Dio instance
  final Dio _dio;

  // Constructor with optional base URL
  DioNetwork({String? baseUrl})
    : _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl ?? ConfigEnv.itbookApiUrl,
          contentType: Headers.jsonContentType,
        ),
      );

  Dio get client => _dio;
}
