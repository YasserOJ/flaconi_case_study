import 'package:flaconi_case_study/modules/weather_information/data/model/weather_response_model.dart';

abstract class WeatherRemoteDataSource{
  Future<WeatherResponseModel> getCurrentWeatherByCity(String city);
}