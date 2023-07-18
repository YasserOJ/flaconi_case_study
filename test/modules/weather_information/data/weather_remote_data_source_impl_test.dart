import 'dart:convert';

import 'package:flaconi_case_study/core/constants/app_constants.dart';
import 'package:flaconi_case_study/core/enums/weather_metrics_enum.dart';
import 'package:flaconi_case_study/core/managers/user_manager.dart';
import 'package:flaconi_case_study/modules/weather_information/data/data_source/weather_remote_data_source.dart';
import 'package:flaconi_case_study/modules/weather_information/data/data_source/weather_remote_data_source_impl.dart';
import 'package:flaconi_case_study/modules/weather_information/data/model/weather_response_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../../base_service_mock.mocks.dart';
import '../../../test_assets/file_reader.dart';

void main() {
  late WeatherRemoteDataSource dataSource;
  late MockBaseServiceMock mockBaseService;
  late UserManager mockUserManager;
  late http.Response wsHttpResponse;

  setUp(() {
    mockBaseService = MockBaseServiceMock();
    mockUserManager = UserManager();
    mockUserManager.userMetric = WeatherMetricsEnum.celsius;
    dataSource = WeatherRemoteDataSourceImpl(
      mockBaseService,
      mockUserManager,
    );
  });

  void setUpMockHttpClientSuccess200() {
    when(
      mockBaseService.getWS(
        uri: currentWeatherUri,
        headers: {},
        params: {'query': 'Paris', 'units': 'm'},
      ),
    ).thenAnswer((_) async {
      wsHttpResponse = http.Response(
        jsonString('weather_info_success_response.json'),
        200,
      );
      return wsHttpResponse;
    });
  }

  group('getCurrentWeatherByCity', () {
    const cityName = 'Paris';
    final WeatherResponseModel weatherResponseModel =
        WeatherResponseModel.fromJson(
      json.decode(
        jsonString('weather_info_success_response.json'),
      ),
    );
    test('verify baseService.getWS called once', () async {
      //arrange
      setUpMockHttpClientSuccess200();

      //act
      await dataSource.getCurrentWeatherByCity(cityName);

      //assert
      verify(
        mockBaseService.getWS(
          uri: currentWeatherUri,
          headers: {},
          params: {'query': 'Paris', 'units': 'm'},
        ),
      ).called(1);
    });

    test('should return NumberTrivia when the response code is 200 (success)',
        () async {
      //arrange
      setUpMockHttpClientSuccess200();
      //act
      final result = await dataSource.getCurrentWeatherByCity(cityName);

      //arrange
      expect(
        result.current?.temperature,
        weatherResponseModel.current?.temperature,
      );
    });
  });
}
