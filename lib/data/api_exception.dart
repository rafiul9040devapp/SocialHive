class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(this.message, [this.statusCode]);

  @override
  String toString() => 'ApiException: $message (Status Code: $statusCode)';

  static ApiException getApiStatus(int response) {
    switch (response) {
      case 400:
        return ApiException(
            'The server cannot process your request. Please try again.',
            response);

      case 401:
        return ApiException(
            'You are unauthorized. Please check your credentials.', response);

      case 403:
        return ApiException(
            'You do not have the necessary permissions.', response);

      case 404:
        return ApiException('The requested resource was not found.', response);

      case 500:
        return ApiException(
            'Internal server error. Please try again later.', response);

      default:
        return ApiException('Something went wrong. Please try again.');
    }
  }


  factory ApiException.fromStatusCode(int statusCode) {
    switch (statusCode) {
      case 400:
        return ApiException(
            'Bad Request: The server cannot process your request. Please try again.',
            statusCode);
      case 401:
        return ApiException(
            'Unauthorized: Please check your credentials.', statusCode);
      case 403:
        return ApiException(
            'Forbidden: You do not have the necessary permissions.',
            statusCode);
      case 404:
        return ApiException(
            'Not Found: The requested resource was not found.', statusCode);
      case 429:
        return ApiException(
            'Too Many Requests: You have sent too many requests in a given amount of time. Please wait and try again later.',
            statusCode);
      case 500:
        return ApiException(
            'Internal Server Error: The server encountered an error and could not complete your request.',
            statusCode);
      case 503:
        return ApiException(
            'Service Unavailable: The server is not ready to handle the request. Please try again later.',
            statusCode);
      default:
        return ApiException(
            'An unexpected error occurred. Please try again. (Status Code: $statusCode)',
            statusCode);
    }
  }
}
