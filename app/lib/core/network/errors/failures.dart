/// Base class representing a generic failure with an error [message].
abstract class Failure {
  const Failure(this.message);

  /// Description of the error.
  final String message;
}

/// Represents a network-related failure, such as loss of connection or timeout.
class NetworkFailure extends Failure {
  const NetworkFailure(super.message, this.statusCode);

  /// Optional HTTP status code associated with the failure.
  final int? statusCode;
}

/// Represents a server-side failure.
class ServerFailure extends Failure {
  const ServerFailure(super.message, this.statusCode);

  /// Optional HTTP status code associated with the failure.
  final int? statusCode;
}

/// Represents a failure caused by unauthorized access..
class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure(super.message, this.statusCode);

  /// Optional HTTP status code associated with the failure.
  final int? statusCode;
}

/// Represents a failure when a requested resource is not found.
class NotFoundFailure extends Failure {
  const NotFoundFailure(super.message, this.statusCode);

  /// Optional HTTP status code associated with the failure.
  final int? statusCode;
}

/// Represents an unknown or unexpected error.
class UnknownFailure extends Failure {
  const UnknownFailure(super.message, this.statusCode);

  /// Optional HTTP status code associated with the failure.
  final int? statusCode;
}
