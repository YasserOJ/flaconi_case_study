import 'dart:convert';

import 'package:flaconi_case_study/core/constants/app_constants.dart';
import 'package:flaconi_case_study/core/enums/weather_metrics_enum.dart';
import 'package:flaconi_case_study/core/managers/user_manager.dart';
import 'package:flaconi_case_study/core/service/base_service.dart';
import 'package:flaconi_case_study/core/utils/dependency_injection/component/app_component.dart';
import 'package:flaconi_case_study/modules/weather_information/data/data_source/weather_remote_data_source.dart';
import 'package:flaconi_case_study/modules/weather_information/data/model/weather_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@Injectable(as: WeatherRemoteDataSource)
class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final BaseService baseService;

  WeatherRemoteDataSourceImpl(this.baseService);

  @override
  Future<WeatherResponseModel> getCurrentWeatherByCity(String city) async {
    try {
      final http.Response result = await baseService.getWS(
        uri: currentWeatherUri,
        params: {
          'query': city,
          'units': _getUserUnits(),
        },
      );
      final dynamic decodedJson = jsonDecode(result.body);
      final WeatherResponseModel responseModel =
          WeatherResponseModel.fromJson(decodedJson);
      return responseModel;
    } catch (e) {
      throw Exception();
    }
  }

  String _getUserUnits() {
    switch (locator<UserManager>().userMetric) {
      case WeatherMetricsEnum.celsius:
        return 'm';
      case WeatherMetricsEnum.fahrenheit:
        return 'f';
      default:
        return 'm';
    }
  }
}
