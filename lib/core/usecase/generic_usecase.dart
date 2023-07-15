import 'package:equatable/equatable.dart';
import 'package:flaconi_case_study/core/common_models/api_result_model.dart';

abstract class GenericUseCase<Type, Params> {
  Future<ApiResultModel<Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => <Object>[];
}
