class WeatherInformationEntity {
  final int temperature;
  final String weatherIcon;
  final String weatherDescription;
  final int windSpeed;
  final int windDegree;
  final String windDir;
  final int pressure;
  final int humidity;
  final int feelsLike;
  final String cityName;
  final String weekDayName;
  final String weekDayAbbreviationName;
  final bool isDay;

  WeatherInformationEntity({
    required this.weekDayName,
    required this.weekDayAbbreviationName,
    required this.temperature,
    required this.feelsLike,
    required this.weatherIcon,
    required this.weatherDescription,
    required this.windSpeed,
    required this.windDegree,
    required this.windDir,
    required this.pressure,
    required this.humidity,
    required this.cityName,
    required this.isDay,
  });
}
