part of 'weather_information_bloc.dart';

abstract class WeatherInformationEvent {
  const WeatherInformationEvent();
}

class GetCurrentWeatherInformationByCityEvent
    implements WeatherInformationEvent {
  final String cityName;

  const GetCurrentWeatherInformationByCityEvent(this.cityName);
}

class GetCurrentWeatherInformationForMultipleCitiesEvent
    implements WeatherInformationEvent {
  const GetCurrentWeatherInformationForMultipleCitiesEvent();
}

class AddCityWeatherInformation implements WeatherInformationEvent {
  final String cityName;

  const AddCityWeatherInformation(this.cityName);
}

class ChangeUserMetrics implements WeatherInformationEvent {
  final bool toFahrenheit;

  const ChangeUserMetrics(this.toFahrenheit);
}
