import 'package:flaconi_case_study/core/common_models/error_model.dart';

sealed class ApiResultModel<T> {
  const ApiResultModel();
}

final class Success<T> extends ApiResultModel<T> {
  final T data;

  const Success(this.data);
}

final class Failure<T> extends ApiResultModel<T> {
  final ErrorModel errorModel;

  const Failure(this.errorModel);
}
