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
