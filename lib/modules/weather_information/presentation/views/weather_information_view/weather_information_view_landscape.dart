import 'package:flaconi_case_study/core/utils/ui_utils/config_setup/config_manager.dart';
import 'package:flaconi_case_study/core/utils/ui_utils/values/styles.dart';
import 'package:flaconi_case_study/generated/l10n.dart';
import 'package:flaconi_case_study/modules/weather_information/domain/entity/weather_information_entity.dart';
import 'package:flaconi_case_study/modules/weather_information/presentation/bloc/weather_information_bloc.dart';
import 'package:flaconi_case_study/modules/weather_information/presentation/widgets/add_city/add_city_widget.dart';
import 'package:flaconi_case_study/modules/weather_information/presentation/widgets/error_popoups/limit_reached_error_popup.dart';
import 'package:flaconi_case_study/modules/weather_information/presentation/widgets/error_popoups/loading_weather_information_error_popup.dart';
import 'package:flaconi_case_study/modules/weather_information/presentation/widgets/loading_widget/loading_indicator_widget.dart';
import 'package:flaconi_case_study/modules/weather_information/presentation/widgets/weather_information_view_app_bar.dart';
import 'package:flaconi_case_study/modules/weather_information/presentation/widgets/weather_information_view_floating_button.dart';
import 'package:flaconi_case_study/modules/weather_information/presentation/widgets/weather_item_detail_card.dart';
import 'package:flaconi_case_study/modules/weather_information/presentation/widgets/weather_list_view.dart';
import 'package:flaconi_case_study/modules/weather_information/presentation/widgets/weather_wind_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherInformationViewLandscape extends StatefulWidget {
  const WeatherInformationViewLandscape({Key? key}) : super(key: key);

  @override
  State<WeatherInformationViewLandscape> createState() =>
      _WeatherInformationViewLandscapeState();
}

class _WeatherInformationViewLandscapeState
    extends State<WeatherInformationViewLandscape> {
  bool shouldShowLoadingIndicator = false;
  WeatherInformationEntity? selectedWeatherInfo;
  int selectedIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final weatherInformation = context.read<WeatherInformationBloc>().weatherInformation;
      if (weatherInformation.isNotEmpty) {
        setState(() {
          selectedWeatherInfo ??= weatherInformation.first;
        });
      }
    });
  }

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
      body: SafeArea(
        top: true,
        bottom: false,
        right: false,
        left: false,
        child: BlocListener<WeatherInformationBloc, WeatherInformationState>(
          listener: (context, state) {
            setState(() {
              if (state is WeatherInformationLoading) {
                shouldShowLoadingIndicator = true;
              } else {
                shouldShowLoadingIndicator = false;
              }

              if (state is WeatherInformationSuccess) {
                selectedWeatherInfo ??= context
                    .read<WeatherInformationBloc>()
                    .weatherInformation
                    .first;
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
            child: ConfigManager(
              builder: (context, config, _) {
                return Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: Scaffold(
                        floatingActionButtonLocation:
                            FloatingActionButtonLocation.miniEndFloat,
                        floatingActionButton:
                            WeatherInformationViewFloatingButton(
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
                        body: WeatherListView(
                          didSelectItem: (item, itemSelectedIndex) {
                            setState(() {
                              selectedWeatherInfo = item;
                              selectedIndex = itemSelectedIndex;
                            });
                          },
                          selectedItem: selectedIndex,
                          areItemsSelectable: true,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context).colorScheme.inversePrimary,
                              Colors.white
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              selectedWeatherInfo?.cityName ?? '',
                              style: boldTextStyle,
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Flexible(
                                  child: Column(
                                    children: [
                                      if (selectedWeatherInfo?.weatherIcon !=
                                          null)
                                        FadeInImage(
                                          placeholder: const AssetImage(
                                              'assets/weather_loading.gif'),
                                          image: NetworkImage(
                                              selectedWeatherInfo
                                                      ?.weatherIcon ??
                                                  ''),
                                        ),
                                      Text(
                                        selectedWeatherInfo
                                                ?.weatherDescription ??
                                            '',
                                        style: normalTextStyle,
                                      ),
                                      Text(
                                        '${selectedWeatherInfo?.temperature}°',
                                      ),
                                      Text(
                                          '${Localized.of(context).feels_like_text} ${selectedWeatherInfo?.feelsLike}°'),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Column(
                                    children: [
                                      Text(
                                        (selectedWeatherInfo?.isDay ?? true)
                                            ? DateTime.now().hour < 16
                                                ? Localized.of(context)
                                                    .good_morning_text
                                                : Localized.of(context)
                                                    .good_afternoon_text
                                            : Localized.of(context)
                                                .good_night_text,
                                        style: boldTextStyle.copyWith(
                                          fontSize:
                                              config.getResponsiveItemSize(25),
                                        ),
                                      ),
                                      Text(
                                        selectedWeatherInfo?.weekDayName ?? '',
                                        style: boldTextStyle.copyWith(
                                            fontSize: config
                                                .getResponsiveItemSize(40)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                WeatherItemDetailCard(
                                  title: Localized.of(context).humidity_text,
                                  description:
                                      '${selectedWeatherInfo?.humidity}%',
                                  iconData: Icons.water_drop,
                                ),
                                WeatherWindDetailsWidget(
                                  windSpeed:
                                      selectedWeatherInfo?.windSpeed ?? 0,
                                  windDirection:
                                      selectedWeatherInfo?.windDir ?? '',
                                ),
                                WeatherItemDetailCard(
                                  title: Localized.of(context).pressure_text,
                                  description:
                                      '${selectedWeatherInfo?.pressure} ${Localized.of(context).pressure_metric_text}',
                                  iconData: Icons.line_axis_outlined,
                                ),
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
