class GenericException implements Exception {
  final int? statusCode;
  final String? message;

  GenericException({
    this.statusCode,
    this.message,
  });
}
