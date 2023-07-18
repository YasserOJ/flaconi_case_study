import 'package:auto_route/auto_route.dart';
import 'package:flaconi_case_study/core/utils/navigation_setup/app_router.gr.dart';
import 'package:flaconi_case_study/modules/weather_information/domain/entity/weather_information_entity.dart';
import 'package:flaconi_case_study/modules/weather_information/presentation/bloc/weather_information_bloc.dart';
import 'package:flaconi_case_study/modules/weather_information/presentation/widgets/add_city/add_city_widget.dart';
import 'package:flaconi_case_study/modules/weather_information/presentation/widgets/error_popoups/limit_reached_error_popup.dart';
import 'package:flaconi_case_study/modules/weather_information/presentation/widgets/error_popoups/loading_weather_information_error_popup.dart';
import 'package:flaconi_case_study/modules/weather_information/presentation/widgets/loading_widget/loading_indicator_widget.dart';
import 'package:flaconi_case_study/modules/weather_information/presentation/widgets/weather_information_view_app_bar.dart';
import 'package:flaconi_case_study/modules/weather_information/presentation/widgets/weather_information_view_floating_button.dart';
import 'package:flaconi_case_study/modules/weather_information/presentation/widgets/weather_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherInformationViewPortrait extends StatefulWidget {
  const WeatherInformationViewPortrait({Key? key}) : super(key: key);

  @override
  State<WeatherInformationViewPortrait> createState() =>
      _WeatherInformationViewPortraitState();
}

class _WeatherInformationViewPortraitState
    extends State<WeatherInformationViewPortrait> {
  bool shouldShowLoadingIndicator = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WeatherInformationViewAppBar(
        appBar: AppBar(),
        switchValueChanged: (bool value) {
          context.read<WeatherInformationBloc>().add(
                ChangeUserMetrics(value),
              );
        },
      ),
      floatingActionButton: WeatherInformationViewFloatingButton(
        buttonClicked: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AddCityWidget(
                onTapFunction: (text) async {
                  context.read<WeatherInformationBloc>().add(
                        AddCityWeatherInformation(text),
                      );
                },
              );
            },
          );
        },
      ),
      body: BlocListener<WeatherInformationBloc, WeatherInformationState>(
        listener: (context, state) {
          setState(() {
            if (state is WeatherInformationLoading) {
              shouldShowLoadingIndicator = true;
            } else {
              shouldShowLoadingIndicator = false;
            }

            if (state is WeatherInformationLimitReached) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return LimitReachedErrorPopup(
                    onTapFunction: () {},
                  );
                },
              );
            }
            if (state is WeatherInformationFailed) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return LoadingWeatherInformationErrorPopup(
                    onTapFunction: () {
                      context.read<WeatherInformationBloc>().add(
                          const GetCurrentWeatherInformationForMultipleCitiesEvent());
                    },
                  );
                },
              );
            }
          });
        },
        child: LoadingIndicatorWidget(
          shouldShowLoadingIndicator: shouldShowLoadingIndicator,
          child: WeatherListView(
            didSelectItem: (WeatherInformationEntity weatherInformationEntity,
                int selectedIndex) {
              context.router.push(
                WeatherInformationDetailsPortraitRoute(
                  weatherInformationEntity: weatherInformationEntity,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
