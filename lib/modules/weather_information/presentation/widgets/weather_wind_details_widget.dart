import 'package:flaconi_case_study/core/utils/ui_utils/config_setup/config_manager.dart';
import 'package:flaconi_case_study/core/utils/ui_utils/values/styles.dart';
import 'package:flaconi_case_study/core/utils/extensions/string_extension.dart';
import 'package:flaconi_case_study/generated/l10n.dart';
import 'package:flutter/material.dart';

class WeatherWindDetailsWidget extends StatelessWidget {
  const WeatherWindDetailsWidget(
      {Key? key, required this.windSpeed, required this.windDirection})
      : super(key: key);

  final int windSpeed;
  final String windDirection;

  @override
  Widget build(BuildContext context) {
    return ConfigManager(
      builder: (context, config, _) {
        return Container(
          padding: EdgeInsets.all(
             config.getResponsiveItemSize(20),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              config.getResponsiveItemSize(20),
            ),
            color: Theme.of(context).colorScheme.primary.withOpacity(.3),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.wind_power),
                  Text(
                    'Wind:',
                    style: boldTextStyle,
                  ),
                ],
              ),
              Text(
                '$windSpeed ${Localized.of(context).wind_speed_metric_text}',
                style: normalTextStyle,
              ),
              Transform.rotate(
                angle: windDirection.getArrowRotationAngle(),
                child: const Icon(
                  Icons.arrow_downward,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
