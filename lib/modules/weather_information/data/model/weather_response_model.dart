import 'package:flaconi_case_study/core/utils/mapper/data_mapper.dart';
import 'package:flaconi_case_study/modules/weather_information/domain/entity/weather_information_entity.dart';
import 'package:intl/intl.dart';

class WeatherResponseModel implements DataMapper<WeatherInformationEntity> {
  final Request? request;
  final Location? location;
  final Current? current;

  WeatherResponseModel({
    this.request,
    this.location,
    this.current,
  });

  factory WeatherResponseModel.fromJson(Map<String, dynamic> json) =>
      WeatherResponseModel(
        request:
            json["request"] == null ? null : Request.fromJson(json["request"]),
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        current:
            json["current"] == null ? null : Current.fromJson(json["current"]),
      );

  @override
  WeatherInformationEntity mapToEntity() {
    final today = DateTime.now();
    return WeatherInformationEntity(
      weekDayName: DateFormat(DateFormat.WEEKDAY).format(today),
      weekDayAbbreviationName:
          DateFormat(DateFormat.ABBR_WEEKDAY).format(today),
      temperature: current?.temperature ?? 0,
      feelsLike: current?.feelsLike ?? 0,
      weatherIcon: current?.weatherIcons?.first ?? '',
      weatherDescription: current?.weatherDescriptions?.first ?? '',
      windSpeed: current?.windSpeed ?? 0,
      windDegree: current?.windDegree ?? 0,
      windDir: current?.windDir ?? '',
      pressure: current?.pressure ?? 0,
      humidity: current?.humidity ?? 0,
      cityName: location?.name ?? '',
      isDay: current?.isDay == 'yes' ? true : false,
    );
  }
}

class Location {
  final String? name;
  final String? country;
  final String? region;
  final String? lat;
  final String? lon;
  final String? timezoneId;
  final String? localtime;
  final int? localtimeEpoch;
  final String? utcOffset;

  Location({
    this.name,
    this.country,
    this.region,
    this.lat,
    this.lon,
    this.timezoneId,
    this.localtime,
    this.localtimeEpoch,
    this.utcOffset,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        country: json["country"],
        region: json["region"],
        lat: json["lat"],
        lon: json["lon"],
        timezoneId: json["timezone_id"],
        localtime: json["localtime"],
        localtimeEpoch: json["localtime_epoch"],
        utcOffset: json["utc_offset"],
      );
}

class Request {
  final String? type;
  final String? query;
  final String? language;
  final String? unit;

  Request({
    this.type,
    this.query,
    this.language,
    this.unit,
  });

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        type: json["type"],
        query: json["query"],
        language: json["language"],
        unit: json["unit"],
      );
}

class Current {
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
  final int? feelsLike;
  final int? uvIndex;
  final int? visibility;
  final String? isDay;
  final String? cityName;

  Current({
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
    this.feelsLike,
    this.uvIndex,
    this.visibility,
    this.isDay,
    this.cityName,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
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
        feelsLike: json["feelslike"],
        uvIndex: json["uv_index"],
        visibility: json["visibility"],
        isDay: json["is_day"],
      );
}
