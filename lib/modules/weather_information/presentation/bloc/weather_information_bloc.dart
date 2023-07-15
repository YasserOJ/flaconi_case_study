import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flaconi_case_study/core/common_models/api_result_model.dart';
import 'package:flaconi_case_study/modules/weather_information/domain/use_case/get_current_weather_information_by_city.dart';
import 'package:injectable/injectable.dart';

part 'weather_information_event.dart';

part 'weather_information_state.dart';

@injectable
class WeatherInformationBloc
    extends Bloc<WeatherInformationEvent, WeatherInformationState> {
  final GetCurrentWeatherInformationByCity getCurrentWeatherInformationByCity;

  WeatherInformationBloc(this.getCurrentWeatherInformationByCity)
      : super(WeatherInformationInitial()) {
    on<WeatherInformationEvent>((event, emit) async {
      if (event is GetCurrentWeatherInformationByCityEvent) {
        emit(WeatherInformationLoading());
        final result = await getCurrentWeatherInformationByCity(
          Params(
            cityName: event.cityName,
          ),
        );
        switch (result) {
          case Success(data: final data):
            emit(WeatherInformationSuccess());
            print(data);
          case Failure(errorModel: final error):
            emit(WeatherInformationFailed());
            print(error);
        }
      }
    });
  }
}
