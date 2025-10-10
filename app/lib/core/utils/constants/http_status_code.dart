/// Defines standard HTTP status codes used across the application.
///
/// Provides named constants for readability and to avoid using raw numbers
/// when handling HTTP responses.
class HttpStatusCode {
  // 2xx
  /// The request has succeeded 200.
  static const int ok = 200;

  // 3xx
  /// The requested resource has been moved permanently to a new URL 301.
  static const int movedPermanently = 301;

  /// The requested resource resides temporarily under a different URL 302.
  static const int found = 302;

  // 4xx
  /// The request could not be understood by the server due to invalid syntax 400.
  static const int badRequest = 400;

  /// Authentication is required or has failed 401.
  static const int unauthorized = 401;

  /// The client does not have access rights to the content 403.
  static const int forbidden = 403;

  /// The server cannot find the requested resource 404.
  static const int notFound = 404;

  /// The method specified in the request is not allowed for the resource 405.
  static const int methodNotAllowed = 405;

  /// The user has sent too many requests in a given amount of time 429.
  static const int tooManyRequests = 429;

  // 5xx
  /// The server encountered an unexpected condition 500.
  static const int internalServerError = 500;

  /// The server received an invalid response from the upstream server 502.
  static const int badGateway = 502;

  /// The server is temporarily unavailable due to maintenance or overload 503.
  static const int serviceUnavailable = 503;

  /// The server did not receive a timely response from the upstream server 504.
  static const int gatewayTimeout = 504;
}
