import 'package:equatable/equatable.dart';
import 'package:flaconi_case_study/core/common_models/api_result_model.dart';
import 'package:flaconi_case_study/core/usecase/generic_usecase.dart';
import 'package:flaconi_case_study/modules/weather_information/domain/entity/weather_information_entity.dart';
import 'package:flaconi_case_study/modules/weather_information/domain/repository/weather_information_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCurrentWeatherInformationByCity
    implements GenericUseCase<WeatherInformationEntity, Params> {
  final WeatherInformationRepository repository;

  const GetCurrentWeatherInformationByCity(this.repository);

  @override
  Future<ApiResultModel<WeatherInformationEntity>> call(Params params) async {
    return await repository.getCurrentWeatherByCity(params.cityName);
  }
}

class Params extends Equatable {
  final String cityName;

  const Params({required this.cityName});

  @override
  List<Object> get props => [cityName];
}
