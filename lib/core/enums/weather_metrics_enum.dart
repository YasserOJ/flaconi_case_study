import 'package:flaconi_case_study/core/constants/app_constants.dart';

enum WeatherMetricsEnum {
  celsius,
  fahrenheit,
}

extension WeatherMetricsEnumExtension on WeatherMetricsEnum {
  String enumToString() {
    switch (this) {
      case WeatherMetricsEnum.celsius:
        return celsiusKey;
      case WeatherMetricsEnum.fahrenheit:
        return fahrenheitKey;
    }
  }
}

extension WeatherMetricsEnumStringExtension on String {
  WeatherMetricsEnum toWeatherMetricsEnum() {
    switch (this) {
      case celsiusKey:
        return WeatherMetricsEnum.celsius;
      case fahrenheitKey:
        return WeatherMetricsEnum.fahrenheit;
      default:
        return WeatherMetricsEnum.celsius;
    }
  }
}
