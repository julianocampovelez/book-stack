import 'package:dio/dio.dart';

import 'package:app/core/network/errors/failure.dart';

/// Provides utilities to convert [DioException] instances into
/// domain-specific [Failure] objects.
///
/// This helps standardize error handling across the app.
class ErrorMapper {
  /// Maps a [DioException] to a corresponding [Failure] type.
  ///
  /// Returns different [Failure] subclasses depending on the
  /// nature of the network or server error.
  static Failure mapDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return NetworkFailure("Tiempo de conexión agotado");

      case DioExceptionType.sendTimeout:
        return NetworkFailure("Tiempo de envío agotado");

      case DioExceptionType.receiveTimeout:
        return NetworkFailure("Tiempo de respuesta agotado");

      case DioExceptionType.badResponse:
        final int status = error.response?.statusCode ?? 0;
        final String message =
            error.response?.data['message'] ?? "Error desconocido";

        if (status >= 500) {
          return ServerFailure("Error del servidor: $message");
        } else if (status == 401) {
          return UnauthorizedFailure("No autorizado: $message");
        } else if (status == 404) {
          return NetworkFailure("Recurso no encontrado");
        } else {
          return NetworkFailure("Error de red ($status): $message");
        }

      case DioExceptionType.cancel:
        return NetworkFailure("Petición cancelada");

      default:
        return UnknownFailure("Error desconocido: ${error.message}");
    }
  }
}
