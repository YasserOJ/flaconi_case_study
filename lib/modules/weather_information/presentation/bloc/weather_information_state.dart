part of 'weather_information_bloc.dart';

abstract class WeatherInformationState extends Equatable {
  const WeatherInformationState();

  @override
  List<Object> get props => [];
}

class WeatherInformationInitial extends WeatherInformationState {}

class WeatherInformationLoading extends WeatherInformationState {}

class WeatherInformationSuccess extends WeatherInformationState {}

class WeatherInformationFailed extends WeatherInformationState {}

class WeatherInformationLimitReached extends WeatherInformationState {}

class WeatherInformationChangedMetrics extends WeatherInformationState {}
