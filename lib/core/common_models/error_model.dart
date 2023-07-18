class ErrorModel {
  ErrorModel({
    this.errorCode,
    this.statusCode,
    this.message,
  });

  ErrorModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> error = json['error'];
    errorCode = error['code'];
    message = error['info'];
  }

  int? errorCode;
  int? statusCode;
  String? message;

  String? getErrorDescription() {
    return message;
  }

  int? getErrorCodeString() {
    return errorCode;
  }
}
