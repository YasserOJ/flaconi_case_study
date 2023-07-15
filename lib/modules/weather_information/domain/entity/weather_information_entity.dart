class WeatherInformationEntity {
  final String? observationTime;
  final int? temperature;
  final int? weatherCode;
  final List<String>? weatherIcons;
  final List<String>? weatherDescriptions;
  final int? windSpeed;
  final int? windDegree;
  final String? windDir;
  final int? pressure;
  final int? precip;
  final int? humidity;
  final int? cloudcover;
  final int? feelslike;
  final int? uvIndex;
  final int? visibility;
  final String? isDay;

  WeatherInformationEntity({
    this.observationTime,
    this.temperature,
    this.weatherCode,
    this.weatherIcons,
    this.weatherDescriptions,
    this.windSpeed,
    this.windDegree,
    this.windDir,
    this.pressure,
    this.precip,
    this.humidity,
    this.cloudcover,
    this.feelslike,
    this.uvIndex,
    this.visibility,
    this.isDay,
  });

  factory WeatherInformationEntity.fromJson(Map<String, dynamic> json) =>
      WeatherInformationEntity(
        observationTime: json["observation_time"],
        temperature: json["temperature"],
        weatherCode: json["weather_code"],
        weatherIcons: json["weather_icons"] == null
            ? []
            : List<String>.from(json["weather_icons"]!.map((x) => x)),
        weatherDescriptions: json["weather_descriptions"] == null
            ? []
            : List<String>.from(json["weather_descriptions"]!.map((x) => x)),
        windSpeed: json["wind_speed"],
        windDegree: json["wind_degree"],
        windDir: json["wind_dir"],
        pressure: json["pressure"],
        precip: json["precip"],
        humidity: json["humidity"],
        cloudcover: json["cloudcover"],
        feelslike: json["feelslike"],
        uvIndex: json["uv_index"],
        visibility: json["visibility"],
        isDay: json["is_day"],
      );
}
