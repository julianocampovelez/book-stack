import 'package:dio/dio.dart';

import 'package:app/core/network/errors/failures.dart';
import 'package:app/core/utils/constants/http_status_code.dart';

/// Provides a mapping between [DioException] instances and
/// domain-specific [Failure] objects.
///
/// This class centralizes error interpretation to ensure consistent
/// error handling and user-friendly messages throughout the app.
class ErrorMapper {
  /// Maps a [DioException] to a corresponding [Failure] type.
  ///
  /// This method first evaluates the [DioExceptionType] to identify
  /// low-level connection or timeout issues. If the error is related
  /// to an HTTP response, it delegates to [_mapHttpStatus] for
  /// status code–specific handling.
  static Failure mapDioError(DioException error) {
    final int status = error.response?.statusCode ?? -1;
    final String message = error.message ?? "Error desconocido";

    // Handle Dio-specific error types before checking HTTP status codes.
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return NetworkFailure("Tiempo de conexión agotado", status);

      case DioExceptionType.sendTimeout:
        return NetworkFailure("Tiempo de envío agotado", status);

      case DioExceptionType.receiveTimeout:
        return NetworkFailure("Tiempo de respuesta agotado", status);

      case DioExceptionType.badCertificate:
        return NetworkFailure("Certificado SSL no válido", status);

      case DioExceptionType.cancel:
        return NetworkFailure("Petición cancelada por el usuario", status);

      case DioExceptionType.connectionError:
        return NetworkFailure("No hay conexión con el servidor", status);

      case DioExceptionType.badResponse:
        return _mapHttpStatus(error);

      case DioExceptionType.unknown:
        return UnknownFailure(message, status);
    }
  }

  /// Maps an HTTP response error to a specific [Failure] subclass.
  ///
  /// This method handles known [HttpStatusCode] values and returns
  /// a more descriptive error message for each. Unknown status codes
  /// default to [UnknownFailure].
  static Failure _mapHttpStatus(DioException error) {
    final int status = error.response?.statusCode ?? -1;
    final String message = error.message ?? "Error desconocido";

    switch (status) {
      case HttpStatusCode.movedPermanently:
        return NetworkFailure("Recurso movido permanentemente", status);

      case HttpStatusCode.found:
        return NetworkFailure("Recurso encontrado en otra ubicación", status);

      case HttpStatusCode.badRequest:
        return NetworkFailure("Petición incorrecta", status);

      case HttpStatusCode.unauthorized:
        return UnauthorizedFailure("No autorizado", status);

      case HttpStatusCode.forbidden:
        return UnauthorizedFailure("Acceso prohibido", status);

      case HttpStatusCode.notFound:
        return NotFoundFailure("Recurso no encontrado", status);

      case HttpStatusCode.methodNotAllowed:
        return NetworkFailure("Método HTTP no permitido", status);

      case HttpStatusCode.tooManyRequests:
        return NetworkFailure(
          "Demasiadas peticiones, intenta más tarde",
          status,
        );

      case HttpStatusCode.internalServerError:
        return ServerFailure("Error interno del servidor", status);

      case HttpStatusCode.badGateway:
        return ServerFailure("Puerta de enlace incorrecta", status);

      case HttpStatusCode.serviceUnavailable:
        return ServerFailure("Servicio no disponible", status);

      case HttpStatusCode.gatewayTimeout:
        return ServerFailure("Tiempo de espera agotado en el servidor", status);

      case -1:
        return NetworkFailure("No hay conexión con el servidor", status);

      default:
        return UnknownFailure("Error desconocido: $message", status);
    }
  }
}
