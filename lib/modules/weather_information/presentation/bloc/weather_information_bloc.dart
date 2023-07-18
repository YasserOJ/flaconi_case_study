import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flaconi_case_study/core/common_models/api_result_model.dart';
import 'package:flaconi_case_study/core/constants/app_constants.dart';
import 'package:flaconi_case_study/core/enums/weather_metrics_enum.dart';
import 'package:flaconi_case_study/core/managers/user_manager.dart';
import 'package:flaconi_case_study/core/utils/app_shared_preferences/app_shared_prefs.dart';
import 'package:flaconi_case_study/core/utils/dependency_injection/component/app_component.dart';
import 'package:flaconi_case_study/modules/weather_information/domain/entity/weather_information_entity.dart';
import 'package:flaconi_case_study/modules/weather_information/domain/use_case/get_current_weather_information_by_city.dart';
import 'package:injectable/injectable.dart';

part 'weather_information_event.dart';

part 'weather_information_state.dart';

@injectable
class WeatherInformationBloc
    extends Bloc<WeatherInformationEvent, WeatherInformationState> {
  final GetCurrentWeatherInformationByCity getCurrentWeatherInformationByCity;

  List<WeatherInformationEntity> weatherInformation = [];

  WeatherInformationBloc(this.getCurrentWeatherInformationByCity)
      : super(WeatherInformationInitial()) {
    on<WeatherInformationEvent>(
      (event, emit) async {
        if (event is GetCurrentWeatherInformationByCityEvent) {
          emit(WeatherInformationLoading());
          final result = await getCurrentWeatherInformationByCity(
            Params(
              cityName: event.cityName,
            ),
          );
          switch (result) {
            case Success(data: final data):
              weatherInformation.add(data);
              emit(WeatherInformationSuccess());
            case Failure(errorModel: final error):
              emit(WeatherInformationFailed());
          }
        }
        if (event is GetCurrentWeatherInformationForMultipleCitiesEvent) {
          emit(WeatherInformationLoading());
          int succeedRequests = 0;
          final List<String> cities =
              locator<UserManager>().userCitiesNames ?? [];
          List<WeatherInformationEntity> tempWeatherInformation = [];

          for (String city in cities) {
            final result = await getCurrentWeatherInformationByCity(
              Params(
                cityName: city,
              ),
            );
            switch (result) {
              case Success(data: final data):
                succeedRequests++;
                tempWeatherInformation.add(data);
              case Failure(errorModel: final error):
                emit(WeatherInformationFailed());
                return;
            }
          }
          if (succeedRequests == cities.length) {
            weatherInformation = tempWeatherInformation;
            emit(WeatherInformationSuccess());
          }
        }
        if (event is AddCityWeatherInformation) {
          if (weatherInformation.length < 4) {
            emit(WeatherInformationLoading());
            final result = await getCurrentWeatherInformationByCity(
              Params(
                cityName: event.cityName,
              ),
            );
            switch (result) {
              case Success(data: final data):
                weatherInformation.add(data);
                final cities = locator<UserManager>().userCitiesNames;
                cities?.add(data.cityName);
                locator<AppSharedPrefs>().saveUserCities(cities ?? []);
                emit(WeatherInformationSuccess());
              case Failure(errorModel: final error):
                emit(WeatherInformationFailed());
            }
          } else {
            emit(WeatherInformationLimitReached());
          }
        }
        if (event is ChangeUserMetrics) {
          emit(WeatherInformationLoading());
          if (event.toFahrenheit) {
            final List<WeatherInformationEntity> tempList =
                weatherInformation.map((e) {
              final tempWeatherInfoEntity = WeatherInformationEntity(
                weekDayName: e.weekDayName,
                weekDayAbbreviationName: e.weekDayAbbreviationName,
                temperature: ((e.temperature * 1.8) + 32).round(),
                feelsLike: ((e.feelsLike * 1.8) + 32).round(),
                weatherIcon: e.weatherIcon,
                weatherDescription: e.weatherDescription,
                windSpeed: e.windSpeed,
                windDegree: e.windDegree,
                windDir: e.windDir,
                pressure: e.pressure,
                humidity: e.humidity,
                cityName: e.cityName,
                isDay: e.isDay,
              );
              return tempWeatherInfoEntity;
            }).toList();
            weatherInformation = tempList;
          } else {
            final List<WeatherInformationEntity> tempList =
                weatherInformation.map((e) {
              final tempWeatherInfoEntity = WeatherInformationEntity(
                weekDayName: e.weekDayName,
                weekDayAbbreviationName: e.weekDayAbbreviationName,
                temperature: ((e.temperature - 32) * .556).round(),
                feelsLike: ((e.feelsLike - 32) * .556).round(),
                weatherIcon: e.weatherIcon,
                weatherDescription: e.weatherDescription,
                windSpeed: e.windSpeed,
                windDegree: e.windDegree,
                windDir: e.windDir,
                pressure: e.pressure,
                humidity: e.humidity,
                cityName: e.cityName,
                isDay: e.isDay,
              );
              return tempWeatherInfoEntity;
            }).toList();
            weatherInformation = tempList;
          }
          locator<AppSharedPrefs>()
              .saveUserMetrics(event.toFahrenheit ? fahrenheitKey : celsiusKey);
          locator<UserManager>().userMetric = event.toFahrenheit
              ? WeatherMetricsEnum.fahrenheit
              : WeatherMetricsEnum.celsius;
          emit(WeatherInformationChangedMetrics());
        }
      },
    );
  }
}
