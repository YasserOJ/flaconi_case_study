import 'package:flaconi_case_study/core/common_models/api_result_model.dart';
import 'package:flaconi_case_study/modules/weather_information/domain/entity/weather_information_entity.dart';

abstract class WeatherInformationRepository {
  Future<ApiResultModel<WeatherInformationEntity>> getCurrentWeatherByCity(
      String city);
}
