import 'package:flaconi_case_study/modules/weather_information/domain/entity/weather_information_entity.dart';

class WeatherResponseModel {
  final Request? request;
  final Location? location;
  final WeatherInformationEntity? current;

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
        current: json["current"] == null
            ? null
            : WeatherInformationEntity.fromJson(json["current"]),
      );
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
