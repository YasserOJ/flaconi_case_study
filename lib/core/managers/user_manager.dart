import 'package:flaconi_case_study/core/enums/weather_metrics_enum.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UserManager {
  List<String>? userCitiesNames;
  WeatherMetricsEnum? userMetric;
}
