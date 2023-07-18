import 'package:auto_route/annotations.dart';
import 'package:flaconi_case_study/core/utils/ui_utils/config_setup/config_manager.dart';
import 'package:flaconi_case_study/core/utils/ui_utils/values/styles.dart';
import 'package:flaconi_case_study/generated/l10n.dart';
import 'package:flaconi_case_study/modules/weather_information/domain/entity/weather_information_entity.dart';
import 'package:flaconi_case_study/modules/weather_information/presentation/widgets/weather_item_detail_card.dart';
import 'package:flaconi_case_study/modules/weather_information/presentation/widgets/weather_wind_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@RoutePage()
class WeatherInformationDetailsPortraitView extends StatefulWidget {
  const WeatherInformationDetailsPortraitView({
    Key? key,
    required this.weatherInformationEntity,
  }) : super(key: key);

  final WeatherInformationEntity weatherInformationEntity;

  @override
  State<WeatherInformationDetailsPortraitView> createState() =>
      _WeatherInformationDetailsPortraitViewState();
}

class _WeatherInformationDetailsPortraitViewState
    extends State<WeatherInformationDetailsPortraitView> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.weatherInformationEntity.cityName),
      ),
      body: ConfigManager(
        builder: (context, config, _) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
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
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Spacer(),
                  FadeInImage(
                    placeholder: const AssetImage('assets/weather_loading.gif'),
                    image: NetworkImage(
                        widget.weatherInformationEntity.weatherIcon),
                  ),
                  Text(
                    widget.weatherInformationEntity.weatherDescription,
                    style: normalTextStyle,
                  ),
                  Text(
                    '${widget.weatherInformationEntity.temperature}°',
                  ),
                  Text(
                      '${Localized.of(context).feels_like_text} ${widget.weatherInformationEntity.feelsLike}°'),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      WeatherItemDetailCard(
                        title: Localized.of(context).humidity_text,
                        description:
                            '${widget.weatherInformationEntity.humidity}%',
                        iconData: Icons.water_drop,
                      ),
                      WeatherItemDetailCard(
                        title: Localized.of(context).pressure_text,
                        description:
                            '${widget.weatherInformationEntity.pressure} ${Localized.of(context).pressure_metric_text}',
                        iconData: Icons.line_axis_outlined,
                      ),
                    ],
                  ),
                  const Spacer(),
                  WeatherWindDetailsWidget(
                    windSpeed: widget.weatherInformationEntity.windSpeed,
                    windDirection: widget.weatherInformationEntity.windDir,
                  ),
                  const Spacer(),
                  Text(
                    widget.weatherInformationEntity.isDay
                        ? DateTime.now().hour < 16
                            ? Localized.of(context).good_morning_text
                            : Localized.of(context).good_afternoon_text
                        : Localized.of(context).good_night_text,
                    style: boldTextStyle.copyWith(
                      fontSize: config.getResponsiveItemSize(30),
                    ),
                  ),
                  Text(
                    widget.weatherInformationEntity.weekDayName,
                    style: boldTextStyle.copyWith(
                        fontSize: config.getResponsiveItemSize(50)),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
}
