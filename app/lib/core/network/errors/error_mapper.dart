import 'package:dio/dio.dart';

import 'package:app/core/network/errors/failure.dart';
import 'package:app/core/utils/constants/http_status_code.dart';

/// Provides a mapping between [DioException] HTTP responses
/// and domain-specific [Failure] objects.
///
/// This class centralizes error interpretation, ensuring
/// consistent handling and user-friendly messages across the app.
class ErrorMapper {
  /// Maps a [DioException] to a specific [Failure] subclass.
  ///
  /// The mapping is based on the HTTP status code returned by the server.
  /// If no status code is available (e.g., due to no network connection),
  /// a [NetworkFailure] is returned by default.
  static Failure mapDioError(DioException error) {
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
